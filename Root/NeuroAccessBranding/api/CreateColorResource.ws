AuthenticateSession(Request,"User");
Authorize(User,"Admin.Presentation.NeuroAccessBranding");

if !(Posted matches {"name": PName})
    then BadRequest("Invalid payload");

insert into Waher.Service.IoTBroker.PubSub.PubSubItem
object 
{
    ItemId: PName,
    Service: "",
    Payload: 
    '<ResourceDictionary xmlns="http://schemas.microsoft.com/dotnet/2021/maui" xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml">' +
        '<Color x:Key="BrandColorsGreyScalesBlackf">#181f25</Color>' +
        '<Color x:Key="BrandColorsGreyScalesGreyv100">#dfe1e3</Color>' +
        '<Color x:Key="BrandColorsGreyScalesGreyv250">#b3b6b8</Color>' +
        '<Color x:Key="BrandColorsGreyScalesGreyv500">#80181f25</Color>' +
        '<Color x:Key="BrandColorsGreyScalesGreyv750">#444a4f</Color>' +
        '<Color x:Key="BrandColorsGreyScalesGreyv900">#2f353a</Color>' +
        '<Color x:Key="BrandColorsGreyScalesPrimaryv">#181f25</Color>' +
        '<Color x:Key="BrandColorsGreyScalesWhitef">#f5f6f7</Color>' +
        '<Color x:Key="BrandColorsNeuroAccessWL">#0080b5</Color>' +
        '<Color x:Key="BrandColorsNeuroAccessa20WL">#33005375</Color>' +
        '<Color x:Key="BrandColorsNeuroAccessa30WL">#4d005375</Color>' +
        '<Color x:Key="BrandColorsNeuroAccessv500WL">#005375</Color>' +
        '<Color x:Key="BrandColorsNeuroAccessv800WL">#002636</Color>' +
        '<Color x:Key="BrandColorsNeuroAdmin">#8f40d4</Color>' +
        '<Color x:Key="BrandColorsNeuroAdmina15Toast">#268f40d4</Color>' +
        '<Color x:Key="BrandColorsNeuroAdminv300">#ab8ce4</Color>' +
        '<Color x:Key="BrandColorsNeuroAdminv800">#231636</Color>' +
        '<Color x:Key="BrandColorsNeuroAssetsWL">#eda63c</Color>' +
        '<Color x:Key="BrandColorsNeuroAssetsa20WL">#33fcb040</Color>' +
        '<Color x:Key="BrandColorsNeuroAssetsv500WL">#b07b2d</Color>' +
        '<Color x:Key="BrandColorsNeuroAssetsv800WL">#4f3714</Color>' +
        '<Color x:Key="BrandColorsNeuroOrange">#f18334</Color>' +
        '<Color x:Key="BrandColorsNeuroOrangea20">#33f18334</Color>' +
        '<Color x:Key="BrandColorsNeuroPay">#ffbb00</Color>' +
        '<Color x:Key="BrandColorsNeuroPaya20">#33ffbb00</Color>' +
        '<Color x:Key="BrandColorsNeuroPayv100">#f8d624</Color>' +
        '<Color x:Key="BrandColorsNeuroPayv800">#a84700</Color>' +
        '<Color x:Key="BrandColorsNeuroRed">#f2495c</Color>' +
        '<Color x:Key="BrandColorsNeuroReda20">#33f2495c</Color>' +
        '<Color x:Key="BrandColorsNeuroReda50">#80f2495c</Color>' +
        '<Color x:Key="BrandColorsNeuroRedv200">#f1bfb9</Color>' +
        '<Color x:Key="BrandColorsNeuroRedv900">#262020</Color>' +
        '<Color x:Key="BrandColorsSpecialGreena20(NoOpacity)">#cce1dd</Color>' +
        '<Color x:Key="BrandColorsSpecialWaveColor">#40ffffff</Color>' +
        '<Color x:Key="ButtonUniversalContentInactiveWL">#80181f25</Color>' +
        '<Color x:Key="ButtonUniversalbgHoldWL">#80181f25</Color>' +
        '<Color x:Key="ButtonUniversalbgInactiveWL">#dfe1e3</Color>' +
        '<Color x:Key="ButtonUniversalbgPressedWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonAccessContentHoldWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonAccessContentPressedWL">#085e50</Color>' +
        '<Color x:Key="ButtonAccessPrimaryContentWL">#005375</Color>' +
        '<Color x:Key="ButtonAccessPrimaryStrokeWL">#00f5f6f7</Color>' +
        '<Color x:Key="ButtonAccessPrimarybgWL">#fbb040</Color>' +
        '<Color x:Key="ButtonAccessSecondaryContentWL">#005375</Color>' +
        '<Color x:Key="ButtonAccessSecondaryStrokeWL">#00fbb040</Color>' +
        '<Color x:Key="ButtonAccessSecondarybgWL">#33fbb040</Color>' +
        '<Color x:Key="ButtonAccessTertiaryContentWL">#005375</Color>' +
        '<Color x:Key="ButtonAccessTertiaryStrokeWL">#00f5f6f7</Color>' +
        '<Color x:Key="ButtonAccessTertiarybgWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonAssetsContentHold">#f5f6f7</Color>' +
        '<Color x:Key="ButtonAssetsContentPressed">#24519c</Color>' +
        '<Color x:Key="ButtonAssetsPrimaryContent">#f5f6f7</Color>' +
        '<Color x:Key="ButtonAssetsPrimaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonAssetsPrimarybg">#2756a6</Color>' +
        '<Color x:Key="ButtonAssetsSecondaryContent">#24519c</Color>' +
        '<Color x:Key="ButtonAssetsSecondaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonAssetsSecondarybg">#334375b0</Color>' +
        '<Color x:Key="ButtonAssetsTertiaryContent">#24519c</Color>' +
        '<Color x:Key="ButtonAssetsTertiaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonAssetsTertiarybg">#f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerContentHoldWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerContentPressedWL">#a81123</Color>' +
        '<Color x:Key="ButtonDangerPrimaryContentWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerPrimaryStrokeWL">#00f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerPrimarybgWL">#f2495c</Color>' +
        '<Color x:Key="ButtonDangerSecondaryContentWL">#a81123</Color>' +
        '<Color x:Key="ButtonDangerSecondaryStrokeWL">#00f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerSecondarybgWL">#33f2495c</Color>' +
        '<Color x:Key="ButtonDangerTertiaryContentWL">#a81123</Color>' +
        '<Color x:Key="ButtonDangerTertiaryStrokeWL">#00f5f6f7</Color>' +
        '<Color x:Key="ButtonDangerTertiarybgWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeuroContentHold">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeuroContentPressed">#722fad</Color>' +
        '<Color x:Key="ButtonNeuroPrimaryContent">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeuroPrimaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeuroPrimarybg">#8f40d4</Color>' +
        '<Color x:Key="ButtonNeuroSecondaryContent">#722fad</Color>' +
        '<Color x:Key="ButtonNeuroSecondaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeuroSecondarybg">#268f40d4</Color>' +
        '<Color x:Key="ButtonNeuroTertiaryContent">#722fad</Color>' +
        '<Color x:Key="ButtonNeuroTertiaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeuroTertiarybg">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralContentHold">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralContentPressed">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralContentWhitefDEL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralbgTertiaryDEL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralGreyContent">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralGreyStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeutralGreybg">#33181f25</Color>' +
        '<Color x:Key="ButtonNeutralNavButtonsContentActiveWL">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralNavButtonsOnContainerbgActiveWL">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralNavButtonsbgActiveWL">#fcfcfc</Color>' +
        '<Color x:Key="ButtonNeutralPrimaryContent">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralPrimaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeutralPrimarybg">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralSecondaryContent">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralSecondaryStroke">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralSecondarybg">#f5f6f7</Color>' +
        '<Color x:Key="ButtonNeutralTertiaryContent">#181f25</Color>' +
        '<Color x:Key="ButtonNeutralTertiaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonNeutralTertiarybg">#f5f6f7</Color>' +
        '<Color x:Key="ButtonPayContentHold">#f5f6f7</Color>' +
        '<Color x:Key="ButtonPayContentPressed">#181f25</Color>' +
        '<Color x:Key="ButtonPayPrimaryContent">#181f25</Color>' +
        '<Color x:Key="ButtonPayPrimaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonPayPrimarybg">#ffbb00</Color>' +
        '<Color x:Key="ButtonPaySecondaryContent">#181f25</Color>' +
        '<Color x:Key="ButtonPaySecondaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonPaySecondarybg">#33ffbb00</Color>' +
        '<Color x:Key="ButtonPayTertiaryContent">#181f25</Color>' +
        '<Color x:Key="ButtonPayTertiaryStroke">#00ffffff</Color>' +
        '<Color x:Key="ButtonPayTertiarybg">#f5f6f7</Color>' +
        '<Color x:Key="ContentAccessWL">#005375</Color>' +
        '<Color x:Key="ContentAssetsWL">#c48932</Color>' +
        '<Color x:Key="ContentLinkWL">#005375</Color>' +
        '<Color x:Key="ContentNeuro">#722fad</Color>' +
        '<Color x:Key="ContentPay">#a84700</Color>' +
        '<Color x:Key="ContentPrimaryWL">#181f25</Color>' +
        '<Color x:Key="ContentPrimaryInverted">#f5f6f7</Color>' +
        '<Color x:Key="ContentSecondaryWL">#9e181f25</Color>' +
        '<Color x:Key="ContentWhitefixed">#f5f6f7</Color>' +
        '<Color x:Key="InputFieldsAccentContentAccessWL">#005375</Color>' +
        '<Color x:Key="InputFieldsAccentContentAssets">#2756a6</Color>' +
        '<Color x:Key="InputFieldsAccentContentNeuro">#8f40d4</Color>' +
        '<Color x:Key="InputFieldsAccentContentYellow">#f18334</Color>' +
        '<Color x:Key="InputFieldsContentDangerv500">#f2495c</Color>' +
        '<Color x:Key="InputFieldsContentDangerv800">#a81123</Color>' +
        '<Color x:Key="InputFieldsContentPrimary">#181f25</Color>' +
        '<Color x:Key="InputFieldsContentSecondary">#80181f25</Color>' +
        '<Color x:Key="InputFieldsContentSubhead">#9e181f25</Color>' +
        '<Color x:Key="InputFieldsSurfaceBackgroundActive">#f5f6f7</Color>' +
        '<Color x:Key="InputFieldsSurfaceBackgroundInactive">#dfe1e3</Color>' +
        '<Color x:Key="InputFieldsSurfaceStroke">#dfe1e3</Color>' +
        '<Color x:Key="InputFieldsSurfaceStrokeInactive">#b3b6b8</Color>' +
        '<Color x:Key="NavMenuBody1WL">#005375</Color>' +
        '<Color x:Key="NavMenuBody2WL">#f5f6f7</Color>' +
        '<Color x:Key="NavMenuContentActiveWL">#fbb040</Color>' +
        '<Color x:Key="NavMenuContentInactiveWL">#dfe1e3</Color>' +
        '<Color x:Key="NavMenuStroke1WL">#dfe1e3</Color>' +
        '<Color x:Key="NavMenuStroke2WL">#dfe1e3</Color>' +
        '<Color x:Key="NavMenubgActiveWL">#40fbb040</Color>' +
        '<Color x:Key="SurfaceBackgroundWL">#f5f6f7</Color>' +
        '<Color x:Key="SurfaceDividerWL">#4d005375</Color>' +
        '<Color x:Key="SurfaceElevation1WL">#fcfcfc</Color>' +
        '<Color x:Key="SurfaceElevation2WL">#f5f6f7</Color>' +
        '<Color x:Key="SurfaceElevation3WL">#fcfcfc</Color>' +
        '<Color x:Key="SurfaceShadowColorWL">#00181f25</Color>' +
        '<Color x:Key="SurfaceStrokeWL">#005375</Color>' +
        '<Color x:Key="SurfaceSpecialScrim">#33005375</Color>' +
        '<Color x:Key="TnPAccent2ContentWL">#005375</Color>' +
        '<Color x:Key="TnPAccent2FigureWL">#005375</Color>' +
        '<Color x:Key="TnPAccent2bgWL">#33005375</Color>' +
        '<Color x:Key="TnPDangerContentWL">#a81123</Color>' +
        '<Color x:Key="TnPDangerFigureLightWL">#f2495c</Color>' +
        '<Color x:Key="TnPDangerFigureWL">#f2495c</Color>' +
        '<Color x:Key="TnPDangerbgWL">#33f2495c</Color>' +
        '<Color x:Key="TnPInfoContentWL">#005375</Color>' +
        '<Color x:Key="TnPInfoFigureWL">#005375</Color>' +
        '<Color x:Key="TnPInfobgWL">#33005375</Color>' +
        '<Color x:Key="TnPNeutralv300ContentWL">#9e181f25</Color>' +
        '<Color x:Key="TnPNeutralv300bgWL">#dfe1e3</Color>' +
        '<Color x:Key="TnPNeutralv750ContentWL">#f5f6f7</Color>' +
        '<Color x:Key="TnPNeutralv750bgWL">#444a4f</Color>' +
        '<Color x:Key="TnPSuccessContentWL">#085e50</Color>' +
        '<Color x:Key="TnPSuccessFigureWL">#29bf86</Color>' +
        '<Color x:Key="TnPSuccessbgWL">#330a715f</Color>' +
        '<Color x:Key="TnPWarningContentWL">#a84700</Color>' +
        '<Color x:Key="TnPWarningFigureWL">#f18334</Color>' +
        '<Color x:Key="TnPWarningbgWL">#33fcb040</Color>' +
    '</ResourceDictionary>',
    Node: "NeuroAccessResources",
    Domain: "pubsub.", 
    Publisher: Gateway.XmppClient.get_BareJID(), 
    Created: NowUtc
};

{
    "success": true
};