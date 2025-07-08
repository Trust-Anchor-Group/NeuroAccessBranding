Title: Main Page
Description: Main page of Content-Only Package Template.
Date: 2024-08-01
Author: Peter Waher
Master: /Master.md
CSS: TemplateStyles.cssx
Javascript: NeuroAccessBranding.js
Javascript: Overview.js

{{
    Resources:= select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubNode where Service="" AND Name="NeuroAccessResources";
    if (Resources = null) then 
    (
        insert into Waher.Service.IoTBroker.PubSub.PubSubNode
        object 
        {
            Service: "", 
            Name: "NeuroAccessResources", 
            Domain: "pubsub.", 
            Creator: "wpf@", 
            Created: NowUtc, 
            Owners: ["wpf@"], 
            IsRoot: True 
        };
    );
    "";
}}


## Resources
### Create new resource
<input id="color-resource-name" type="text">
<button id="color-resource-button">Create</button>

### Available Resources
<div>
{{
    resources := select top 50 * from Waher.Service.IoTBroker.PubSub.PubSubItem where Service="" AND Node="NeuroAccessResources";

    foreach resource in resources do (
        ]]<a class="button" href="EditResource.md?ResourceName=((resource.ItemId))">((resource.ItemId))</a>[[
    )

}}
</div>