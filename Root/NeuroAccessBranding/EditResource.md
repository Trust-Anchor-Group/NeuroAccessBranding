Title: Main Page
Description: Main page of Content-Only Package Template.
Date: 2024-08-01
Author: Peter Waher
Master: /Master.md
Parameter: ResourceName
CSS: TemplateStyles.cssx
Javascript: NeuroAccessBranding.js
Javascript: EditResource.js

{{
    if !(ResourceName matches Str(PResourceName)) then
        BadRequest("No resource name");

    ItemId:=Create(Waher.Persistence.CaseInsensitiveString, PResourceName);
    
    Resource:= select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubItem WHERE Service="" AND Node="NeuroAccessResources" AND ItemId=ItemId;

    if (Resource = null) then 
        BadRequest("No such resource");

    PayloadXml:=Xml(Resource.Payload);
    Colors:=PayloadXml.DocumentElement;

    "";
}}


=========================================================================================================================================================

# {Resource.ItemId}

# Colors

<div id="color-container">
{{
    i:=0;
    foreach Color in Colors.ChildNodes do (
        if !(Color.Attributes = null) then (
            Key:=HtmlValueEncode(Color.Attributes.get_ItemOf("x:Key").Value);
            Value:=HtmlValueEncode(Color.InnerXml);
            ]]
            <input value="((Key))" data-id="((i))">
            <input value="((Value))" data-color-input data-id="((i))"/>
            <div class="color-preview" style="background-color: ((Value))" data-id="((i))"></div>
            <button class="negButtonSm" data-remove-button data-id="((i))">Remove</button>[[;
            i++;
        )
    )
}}
</div>

<button id="back-button" class="posButton">Back</button>
<button id="insert-color-button" class="posButton">Insert Color</button>
<button id="quick-set-button" class="posButton">Quick Set</button>
<button id="save-button" class="posButton">Save</button>
<button id="delete-button" class="negButton">Delete</button>