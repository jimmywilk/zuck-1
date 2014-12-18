require 'spec_helper'

describe Zuck::FbObject do

  before(:all) do
    Zuck.graph = Koala::Facebook::API.new(test_access_token)
  end

  let(:graph)   { Zuck.graph                                                  }
  let(:account) { Zuck::AdAccount.new(graph,  {id: "act_10150585630710217"})  }
  let(:campaign){ Zuck::AdCampaign.new(graph, {id: "6021499361751"}, account) }
  let(:group)   { Zuck::AdGroup.new(graph,    {id: "6010889169151"}, campaign)}
  let(:creative){ Zuck::AdCreative.new(graph, {id: "6021396606151"}, group)   }
  let(:set)     { Zuck::AdSet.new(graph,      {id: "6021525283751"}, account)   }


  describe "read only objects" do
    it "can't be created" do
      expect{
        Zuck::AdCreative.create(:x, {}, :y)
      }.to raise_error(Zuck::Error::ReadOnly)
    end

    it "can't be saved" do
      expect{
        creative.save
      }.to raise_error(Zuck::Error::ReadOnly)
    end

    it "can't be destroyed" do
      expect{
        creative.destroy
      }.to raise_error(Zuck::Error::ReadOnly)
    end
  end

  describe "talking to facebook" do
    context "reading" do

      it "a list of ad accounts" do
        VCR.use_cassette('list_of_ad_accounts') do
          Zuck::AdAccount.all.should have(2).items
        end
      end

      it "a list of ad campaigns" do
        VCR.use_cassette('list_of_ad_campaigns') do
          account.ad_campaigns.should have(24).items
        end
      end

      it "a list of ad groups" do
        VCR.use_cassette('list_of_ad_groups') do
          campaign.ad_groups.should have(4).item
        end
      end

      it "list of ad creatives" do
        VCR.use_cassette('list_of_ad_creatives') do
          group.ad_creatives.should have(1).items
        end
      end

      it "list of all ad creatives of an account" do
        g = graph
        Zuck::AdAccount.should_receive(:all).and_return([account])
        VCR.use_cassette('list_of_all_ad_creatives_of_account') do
          Zuck::AdCreative.all(g).should have(13).items
        end
      end

      context "an id directly" do

        it "campaign with the correct type" do
          VCR.use_cassette('a_single_campaign') do
            c = Zuck::AdCampaign.find(6021496142951, graph)
          end
        end

        it "account with the correct type" do
          VCR.use_cassette('a_single_account') do
            c = Zuck::AdAccount.find('act_10150585630710217', graph)
          end
        end

        it "when expecting an ad group but the id belongs to a campaign" do
          VCR.use_cassette('a_single_group') do
            expect{
              c = Zuck::AdGroup.find(6010889111951, graph)
            }.to raise_error(Koala::Facebook::ClientError)
          end
        end

        it "and saving it" do
          VCR.use_cassette('find_a_single_group_and_update_it') do
            group = Zuck::AdGroup.find(6021525861551, graph)
            group.name = "My old name"
            group.save
            group.name.should == "My old name"
            group.name = "My new name"
            group.save
            group.name.should == "My new name"
            group.reload
            group.name.should == "My new name"
          end
        end

      end
    end


    context "creating" do
      it "an ad set" do
        VCR.use_cassette('create_ad_set') do
          o = {
            name: 'test ad set',
            campaign_status: 'PAUSED',
            daily_budget: 100,
            targeting: "{'geo_locations':{'countries':['US','GB']}}",
            campaign_group_id: campaign.id
          }
          ad_set = Zuck::AdSet.create(graph, o, account)
          ad_set.name.should == 'test ad set'
        end
      end

      it "an ad campaign" do
        VCR.use_cassette('create_ad_campaign') do
          o = {objective: 'NONE', name: "bloody", campaign_group_status: 'PAUSED' }
          campaign = Zuck::AdCampaign.create(graph, o, account)
          campaign.name.should == "bloody"
        end
      end

      it "an ad campaign via an existing ad account" do
        VCR.use_cassette('create_ad_campaign') do
          o = {daily_budget: 1000, name: "bloody" }
          campaign = account.create_ad_campaign(o)
          campaign.name.should == "bloody"
        end
      end

      it "an ad group via an existing ad campaign" do
        VCR.use_cassette('create_ad_group') do
          o = {
            bid_type: 'CPC',
            bid_info: '{"CLICKS": 1}',
            name: "Rap like me",
            targeting: '{"geo_locations": {"countries":["US"]}}',
            objective: 'WEBSITE_CLICKS',
            creative: '{"creative_id": "6021396606151"}'
          }
          group = set.create_ad_group(o)
          group.name.should == "Rap like me"
          group.bid_type.should == 'CPC'
        end
      end
    end

    context "deleting" do
      it "an ad group" do
        VCR.use_cassette('delete_ad_group') do
          group.destroy.should be_true
        end
      end
    end

  end
end
