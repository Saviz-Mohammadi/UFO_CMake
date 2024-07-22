function scrollToTop()
{
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

window.onscroll = function()
{
    // Check if screen width is less than or equal to 768px
    if (window.innerWidth <= 768)
    {
        document.getElementById("scrollToTopButton").style.display = "none";
        return;
    }

    // For screens wider than 768px, handle scroll behavior
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20)
    {
        document.getElementById("scrollToTopButton").style.display = "block";
    }
    
    else
    {
        document.getElementById("scrollToTopButton").style.display = "none";
    }
};