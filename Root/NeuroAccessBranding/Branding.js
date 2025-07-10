window.addEventListener("load", () => {
    const NeuroAccessBranding = NeuroAccessBrandingHandler()

    function GetAffiliation(affiliationContainer) {
        const jid = affiliationContainer.querySelector("input[type='text']").value
        const affiliation = affiliationContainer.querySelector("select").value

        if (jid === "")
            return undefined

        return { jid, affiliation}
    }

    const COLOR_RESOURCE_NAME_INPUT_ID = "color-resource-name"
    const COLOR_RESOURCE_NAME_BUTTON_ID = "color-resource-button"
    const SAVE_AFFILIATIONS_BUTTON_ID = "save-affiliations-button"

    document.getElementById(COLOR_RESOURCE_NAME_BUTTON_ID).addEventListener("click", async () => {
        const newResourceName = document.getElementById(COLOR_RESOURCE_NAME_INPUT_ID).value
        await NeuroAccessBranding.CreateColoResource(newResourceName)
        window.location.href = "Index.md"
    })

    document.getElementById(SAVE_AFFILIATIONS_BUTTON_ID).addEventListener("click", () => {
        const affiliationContainers = Array.from(document.querySelectorAll(".affiliation"))

        const affiliations = [] 

        affiliationContainers.forEach(affiliationContainer => {
            affiliations.push(GetAffiliation(affiliationContainer))
        });

        NeuroAccessBranding.SetAffiliations(affiliations.filter(x => x))
    })
})