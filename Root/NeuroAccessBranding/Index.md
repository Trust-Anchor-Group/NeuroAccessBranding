Title: Main Page
Description: Main page of Content-Only Package Template.
Date: 2024-08-01
Author: Peter Waher
Master: /Master.md
CSS: TemplateStyles.cssx
Javascript: NeuroAccessBranding.js
Javascript: Branding.js

{{
    BrandingNode:= select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubNode where Service="" AND Name="NeuroAccessBranding";
    if (BrandingNode = null) then (
        insert into Waher.Service.IoTBroker.PubSub.PubSubNode
        object 
        {
            Service: "", 
            Name: "NeuroAccessBranding", 
            Domain: "pubsub.", 
            Creator: Gateway.XmppClient.get_BareJID(), 
            Created: NowUtc, 
            Owners: [Gateway.XmppClient.get_BareJID()], 
            IsRoot: True 
        };
        BrandingNode:= select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubNode where Service="" AND Name="NeuroAccessBranding";
    );

    BrandingV2:=select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubItem WHERE Service="" AND Node="NeuroAccessBranding" AND ItemId="BrandingV2";
    if (BrandingV2 = null) then (
        insert into Waher.Service.IoTBroker.PubSub.PubSubItem
        object 
        {
            ItemId: "BrandingV2",
            Service: "",
            Payload: 
                '<BrandingDescriptor xmlns="urn:neuroaccess:branding:2.0">' +
                    '<Version major="0" minor="0" patch="0" />' +
                    '<ColorPalettes>' +
                    '</ColorPalettes>' +
                    '<Images>' +
                    '</Images>' +
                '</BrandingDescriptor>',
            Node: "NeuroAccessBranding",
            Domain: "pubsub.", 
            Publisher: Gateway.XmppClient.get_BareJID(), 
            Created: NowUtc 
        };
    );

    Resources:= select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubNode where Service="" AND Name="NeuroAccessResources";
    if (Resources = null) then 
    (
        insert into Waher.Service.IoTBroker.PubSub.PubSubNode
        object 
        {
            Service: "", 
            Name: "NeuroAccessResources", 
            Domain: "pubsub.", 
            Creator: Gateway.XmppClient.get_BareJID(), 
            Created: NowUtc, 
            Owners: [Gateway.XmppClient.get_BareJID()], 
            IsRoot: True 
        };
    );
    resources := select top 50 * from Waher.Service.IoTBroker.PubSub.PubSubItem where Service="" AND Node="NeuroAccessResources";
    "";
}}

===================================

# Branding

## Affiliations
-------------------------------

{{
    Affiliations:=BrandingNode.GetAffiliations();

    foreach Affiliation in Affiliations do (
        ]]
            <div class="affiliation" data-old-affiliation>
                <p>JID:</p>
                <input value=((HtmlValueEncode(Affiliation.Key);)) type="text"/>
                <p>Affiliaton:</p>
                <select>
                    <option value="owner" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.owner ? "selected" : ""))>Owner</option>
                    <option value="publisher" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.publisher ? "selected" : ""))>Publisher</option>
                    <option value="publishOnly" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.publishOnly ? "selected" : ""))>PublishOnly</option>
                    <option value="member" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.member ? "selected" : ""))>Member</option>
                    <option value="none" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.none ? "selected" : ""))>None</option>
                    <option value="outcast" ((Affiliation.Value = Waher.Service.IoTBroker.PubSub.AffiliationStatus.outcast ? "selected" : ""))>Outcast</option>
                </select>
            </div>
        [[
    )
}}

-----------------------------------

<p>Add new affiliation (leave empty if not)</p>
<div class="affiliation">
    <p>JID:</p>
    <input value="" type="text"/>
    <p>Affiliaton:</p>
    <select>
        <option value="owner">Owner</option>
        <option value="publisher">Publisher</option>
        <option value="publishOnly">PublishOnly</option>
        <option value="member">Member</option>
        <option value="none">None</option>
        <option value="outcast">Outcast</option>
    </select>
</div>

<button id="save-affiliations-button">Add / Save</button>

## Color Resources
-------------------------------

### Create new color resource
<input id="color-resource-name" type="text">
<button id="color-resource-button">Create</button>

### Available color resources
<div>
{{
    foreach resource in resources do (
        ]]<a class="button" href="EditResource.md?ResourceName=((resource.ItemId))">((resource.ItemId))</a>[[
    )

}}
</div>