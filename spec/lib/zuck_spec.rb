require 'spec_helper'

describe "talking to facebook" do

  before(:all) do
    Zuck.graph = Koala::Facebook::API.new('AAAEvJ5vzhl8BAG3qjJXGVUVKTzjMLrirxcVxllKJdthkQrEstIgXzMYZAAzg0ETsCGMGmX9UvUh4ZCGvATX9ZCnjNee18OTtQ9ZAarrDBQZDZD')
  end

  let(:graph)   { Zuck.graph                                                  }
  let(:account) { Zuck::AdAccount.new(graph,  {id: "act_10150585630710217"})  }
  let(:campaign){ Zuck::AdCampaign.new(graph, {id: "6004497037951"}, account) }
  let(:group)   { Zuck::AdGroup.new(graph,    {id: "6004497038951"}, campaign)}

  context "reading" do

    it "a list of ad accounts" do
      VCR.use_cassette('list_of_ad_accounts') do
        Zuck::AdAccount.all.should have(1).item
      end
    end

    it "a list of ad campaigns" do
      VCR.use_cassette('list_of_ad_campaigns') do
        account.ad_campaigns.should have(1).item
      end
    end

    it "a list of ad groups" do
      VCR.use_cassette('list_of_ad_groups') do
        campaign.ad_groups.should have(3).items
      end
    end

    it "list of ad creatives" do
      VCR.use_cassette('list_of_ad_creatives') do
        group.ad_creatives.should have(1).items
      end
    end
  end

  context "creating" do
    let(:graph){ Koala::Facebook::API.new('AAAEvJ5vzhl8BAAExaMreeha9sPAZASaclkkuheSlbjjbiSKwcYcbdC5boZBxyCevcnx5YbY0kyd7YVJNjmrqDt0ZCJAXJbJPCLQdfqeTwZDZD') }

    it "an ad campaign" do
      VCR.use_cassette('create_ad_campaign') do
        o = {daily_budget: 1000, name: "bloody" }
        campaign = Zuck::AdCampaign.create(graph, o, account)
        campaign.name.should == "bloody"
      end
    end

    it "an ad group" do
      VCR.use_cassette('create_ad_group') do
        o = {bid_type: 1, max_bid: 1, name: "Rap like me", targeting: '{"countries":["US"]}',
             creative: '{"type":25,"action_spec":{"action.type":"like", "post":10150420410887685}}'}
        group = Zuck::AdGroup.create(graph, o, campaign)
        group.name.should == "Rap like me"
      end
    end

    it "an ad group via an existing instance" do
      VCR.use_cassette('create_ad_group') do
        o = {bid_type: 1, max_bid: 1, name: "Rap like me", targeting: '{"countries":["US"]}',
             creative: '{"type":25,"action_spec":{"action.type":"like", "post":10150420410887685}}'}
        group = campaign.create_ad_group(o)
        group.name.should == "Rap like me"
      end
    end

  end
end
