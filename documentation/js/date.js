document.addEventListener('DOMContentLoaded', function()
{
    var currentYear = new Date().getFullYear();
    
    var element = document.getElementById('current-year');
    
    element.textContent = 'Last updated: ' + currentYear + '';
});
