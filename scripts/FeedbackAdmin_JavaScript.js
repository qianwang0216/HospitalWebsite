$(document).ready(function () {

           if ($('[id*=lbl_titleSelect]').is(':empty')) { //if element doesn't have any data pop-up isn't shown
               $('.selectView').hide();// hide the pop_up div
           }
           else {// if the element has data shows pop-up
               $('.selectView').show();// show the pop-up
           }

           //close pop-up by clicking close button
           $("[id*=btn_cancelView]").click(function () {
               $('.selectView').hide();
           });

           //if user clicks anywhere in the page it doesn't close
           $('.selectView').click(function () {
               return false;
           });
       });
