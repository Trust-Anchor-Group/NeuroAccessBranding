window.addEventListener("load", () => {
    const NeuroAccessBranding = NeuroAccessBrandingHandler()

    const COLOR_RESOURCE_NAME_INPUT_ID = "color-resource-name"
    const COLOR_RESOURCE_NAME_BUTTON_ID = "color-resource-button"

    document.getElementById(COLOR_RESOURCE_NAME_BUTTON_ID).addEventListener("click", async () => {
        const newResourceName = document.getElementById(COLOR_RESOURCE_NAME_INPUT_ID).value
        await NeuroAccessBranding.CreateColoResource(newResourceName)
        window.location.href = "Index.md"
    })
})