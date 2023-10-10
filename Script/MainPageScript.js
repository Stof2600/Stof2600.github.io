function OnloadPage()
{
    let LoadLang = document.cookie;
    document.documentElement.setAttribute('lang', LoadLang);

}


function LoadRandomIcon(StartPath)
{
    let Path = StartPath + "/Icons/"

    let R = Math.random();
    let  SelectedImage = "MainImages/Icons/Ky.jpg"

    if (R <= 0.125)
    {
        SelectedImage = Path + "BS.jpg"
    }
    else if (R <= 0.25)
    {
        SelectedImage = Path + "i_forgor.jpg"
    }
    else if (R <= 0.375)
    {
        SelectedImage = Path + "Ky.jpg"
    }
    else if (R <= 0.5)
    {
        SelectedImage = Path + "Sin.jpg"
    }
    else if (R <= 0.625)
    {
        SelectedImage = Path + "Sorrow.jpg"
    }
    else if (R <= 0.75)
    {
        SelectedImage = Path + "Stare.jpg"
    }
    else if (R <= 0.875)
    {
        SelectedImage = Path + "Wait.jpg"
    }
    else
    {
        SelectedImage = Path + "wuh_huh.jpg"
    }

    document.getElementById("IconImage").src = SelectedImage;
}

function LoadPage(PagePath)
{
    window.location.href = PagePath;
}

function googleTranslateElementInit(NewLang)
{
    new google.translate.TranslateElement({pageLanguage: NewLang}, 'google_translate_element');
}

