document.addEventListener('DOMContentLoaded', function()
{
    var currentYear = new Date().getFullYear();
    
    var element = document.getElementById('current-year');
    
    var currentContent = element.textContent;
    
    element.textContent = currentContent + ' Last updated on year ' + currentYear;
});
