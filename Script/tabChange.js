let MaxTabs
let CurrentTab = 0;

let Tabs = [];

function SetMaxTabs(Num)
{
    MaxTabs = Num;

    for (let x = 0; x < MaxTabs; x++)
    {
        Tabs[x] = document.getElementById("Tab" + x)
    }

    SetCurrentTab(0);
}

function SwapTabs()
{
    for (let x = 0; x < MaxTabs; x++)
    {
        if (x === CurrentTab)
        {
            Tabs[x].style.display = 'block';
        }
        else
        {
            Tabs[x].style.display = 'none';
        }
    }
}

function SetCurrentTab(tab)
{
    CurrentTab = tab;
    SwapTabs();
}