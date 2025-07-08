window.addEventListener("load", () =>
{
    const NeuroAccessBranding = NeuroAccessBrandingHandler()

    const params = new URLSearchParams(window.location.search)
    const resourceName = params.get("ResourceName")

    const SAVE_BUTTON_ID = "save-button"
    const DELETE_BUTTON_ID = "delete-button"
    const QUICK_SET_BUTTON_ID = "quick-set-button"
    const COLORS_CONTAINER_ID = "color-container"
    const INSERT_COLOR_BUTTON = "insert-color-button"
    const BACK_BUTTON = "back-button"

    document.getElementById(BACK_BUTTON).addEventListener("click", () => {
        window.location.href = "Index.md"
    })

    document.getElementById(SAVE_BUTTON_ID).addEventListener("click", () =>
    {
        const container = document.getElementById(COLORS_CONTAINER_ID)
        const elements = container.children

        const colorObjects = []

        for (let i = 0; i < elements.length; i += 4)
        {
            const name = elements[i].value
            const color = elements[i + 1].value
            colorObjects.push({ name, color })
        }

        NeuroAccessBranding.UpdateColorResource(resourceName, colorObjects)
    })

    document.getElementById(DELETE_BUTTON_ID).addEventListener("click", async () =>
    {
        const shouldDelete = await Popup.Confirm("Do you want to delete this resource? This action can not be undone.");
        if (shouldDelete)
        {
            await NeuroAccessBranding.DeleteColorResource(resourceName)
            window.location.href = "Index.md"
        }
    })

    document.getElementById(INSERT_COLOR_BUTTON).addEventListener("click", () =>
    {
        const container = document.getElementById(COLORS_CONTAINER_ID)
        const nextId = Number(container.lastElementChild.getAttribute("data-id")) + 1
        container.innerHTML += `
            <input value="name" data-id="${nextId}">
            <input value="#FF00FF" data-color-input data-id="${nextId}"/>
            <div class="color-preview" style="background-color: #FF00FF" data-id="${nextId}"></div>
            <button class="negButtonSm" data-remove-button data-id="${nextId}">Remove</button>
        `
    })

    document.getElementById(QUICK_SET_BUTTON_ID).addEventListener("click", async () => {
        const xml = await Popup.Prompt("replace current resource with an already valid xml document.")
        if ((await Popup.Confirm("Do you want to replace the current resource? This action can not be undone.")))
        {
            await NeuroAccessBranding.ReplaceColorResource(resourceName, xml)

            window.location.reload()
        }
    })

    Array.from(document.querySelectorAll("[data-color-input]")).forEach(input =>
    {
        input.addEventListener("input", (e) =>
        {
            const id = e.target.getAttribute("data-id")
            const color = NeuroAccessBranding.FinalHexValue(e.target.value)
            if (color === undefined)
            {
                document.querySelector(`.color-preview[data-id="${id}"]`).style.background = `
                    repeating-conic-gradient(#808080 0 25%, #0000 0 50%) 
                    50% / 20px 20px
                `
            }
            else
            {
                document.querySelector(`.color-preview[data-id="${id}"]`).style.background = ""
                document.querySelector(`.color-preview[data-id="${id}"]`).style.backgroundColor = color
            }
        })
    })

    Array.from(document.querySelectorAll("[data-remove-button]")).forEach(button =>
    {
        button.addEventListener("click", (e) =>
        {
            const id = e.target.getAttribute("data-id")
            Array.from(document.querySelectorAll(`[data-id="${id}"]`)).forEach(element => element.remove())
        })
    })
})