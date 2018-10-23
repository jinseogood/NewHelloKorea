/*
 * jQuery v1.9.1 included
 */



$(document).ready(function() {
  window.onresize = function(){
    setMobileStyles();
  };
  $('.language-li').prepend($('.language-selector').clone());
  var $languagePanel = $(".language-li").find(".dropdown-menu");
  $languagePanel.addClass("dropdown-panel").removeClass("dropdown-menu-end");


  function setMobileStyles(){
    $('.category h2').unbind();
    if($(window).width() < 500){
      if ( !$('.help').parent().is('a') ) {
        $('.help').wrap($('<a href="/"></a>'));  
      }
    } else {
    (function setUpAccordion(){
      $('.category h2').click(function(){
        $(this).parent().find('section, .articleWrapper').slideToggle();
        $(this).find('.dd-arrow').toggleClass('arrow-up');
      });
    })();      
    }
  }
  setMobileStyles();

  //Custom text in search box
if(HelpCenter.user.role!='anonymous')
  
  
  // set up my requests button:
  var $requestText = $('.my-requests-text');
  if ($requestText && $requestText.text().length > 0 ){
    $('.my-requests-link').text($requestText.text());
  }  
  
  // set dropdown in footer:
  $('.footer-version-nav .dropdown-toggle').click(function(){
    var $this = $(this),
        $dropdown = $this.closest("li");

    if ($dropdown.hasClass("active")) {
      $(".footer-nav .active").removeClass("active");
    } else {
      $(".footer-nav .active").removeClass("active");

      $dropdown.addClass("active");
    }
  });

  $(document).click(function(event) {
    var $panel = $(event.target).closest('.footer-version-nav .active');
      if(!$panel.length) {
        $activePanel = $(".footer-version-nav .active");
          if($activePanel.is(":visible")) {
            $activePanel.removeClass("active");
          }
      }        
  })




  // add caret to related articles box
  $('.related-articles li a').before('<span class="caret">></span>');
  
  //restyle header user nav when lang is right to left:
  function hasRightToLeft() {
    // add to this array if more right-to-left languages are added:
    var rtl = ["ar-eg", "he"];
    for (var i = 0; i < rtl.length; i++){
      if (HelpCenter.user.locale && HelpCenter.user.locale.indexOf(rtl[i]) > 0 || window.location.pathname.indexOf("/"+rtl[i]) > 0 ) {
        return true;
      }
    }
  }
  if (hasRightToLeft()) {
    $('.user-nav').css('left', '0');
    $('.section h3').css('marginRight', '75px');
    $('.main-secondary').css('textAlign', 'right');
    $('.main-secondary-nav ul').css('float', 'left');
  } else {
      $('.user-nav').css('right', '0'); 
  }
  
  //hide login button until SSO is set up
  $('.login').hide();
  
  //hide browse community button on search results
  $('a:contains(browse Community)').hide();
  
  //hide show footer text
  $('.footer-short').click(function(){$('.footer-long').toggle();});
  
  // hide empty list items
  var navItems = $('.dropdown li');
  
  for ( var i = 0; i < navItems.length; i++ ) {
    
    if ($(navItems[i]).find('a').length === 0) {
      $(navItems[i]).hide();
    }
  }
  
  // hide empty about us link
  if ($('.about-us').find('a').length === 0 ) {
    $('.about-us').hide();
  }
  
  
  //move "and" text if three links are present in footer
  var pol_links = $('.policy-links a');
  if(pol_links.length > 2) {
    $('span.local_and').insertAfter($(pol_links[1]));
  }
  
  //make 'more' text look like link in footer
  var regExp = /\(([^)]+)\)/,
  strs = $('.footer-short').text().split(regExp);
  strs[1] = "<span class='footer-more-link'>(" + strs[1] + ")</span>";
  $('.footer-short').replaceWith("<span class='footer-short'>" + strs[0] + strs[1] + "</span>");
  $('.footer-short').click(function(){$('.footer-long').toggle();});  

//hide tripadvisor menu is submenu is empty
var dd = $('ul.dropdown');
for ( var i = 0; i< dd.length; i++ ) {
    var lis = $(dd[i]).find('li').text();
    if ( lis.length <= 1 ) {
      $(dd[i]).prev('.dropdown-top').hide();
    }
}

// Only show three articles at a time:
if( document.location.href.indexOf('section') == -1 ) {
  var categories = $('ul.article-list'),
      articlestring = $('.articles-text').text();
  for (var j = categories.length - 1; j >= 0; j--) {
    var articles = $(categories[j]).find('li'),
      link = $(categories[j]).parent().find('h3 a').attr('href');
    if ( articles.length > 3 ) {
      for (var k = 3; k < articles.length; k++ ) {
        $(articles[k]).hide();
      }
      if ( $(categories[j]).parent().find('.see-all-articles').length < 1  ) {
        $(categories[j]).after('<a class="see-all-articles" href="'+ link +'">' + articles.length + ' ' + articlestring +'</a>');
      }
    }
  } 

  //console.log($(".see-all-articles"))
  
  $('.see-all-articles').each(function(){
    var text = $(this).text(),
    num = text.match(/\d+/),
    word = $('.articles-text').text();
    
    $(this).text(num + ' ' + word);
    $(this).insertAfter($(this).closest(".section").find('h3'));
      $(this).after('<div class="ribbon-top"></div><div class="ribbon-bottom"></div>');
  });
}


  var $requestDetails = $(".request-details")
  if ($requestDetails.length) {
    var requestId = $(".request-id"),
        statusLabel = $requestDetails.find("dt:contains('Status')"),
        status = statusLabel.next("dd"),
        html = "";

    html += "<span class='request-id'>" + requestId.text() + "</span>";
    html += "<dt>" + statusLabel.text() + "</dt>";
    html += "<dd>" + status.html() + "</dd>";

    $requestDetails.empty().append(html).addClass("in");
  }



  //wow come on browsers
if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1 || navigator.userAgent.toLowerCase().indexOf('windows') > -1) {
  $('.see-all-articles').addClass('ieff');
}

   (function fixArticleSectionsFloat(){
    var categories = $('.category');
    for ( var j = 0; j < categories.length; j++ ){
      sections = $(categories[j]).find('section');
      for (var i = 1; i < sections.length; i++ ) {
        if ( i%2 !== 0 ) {
          $(sections[i]).prev('section').andSelf().wrapAll('<div class="articleWrapper"></div>');
        }
      }
    }
  })();
  
  $('.category-list li, .category h2').append('<div class="dd-arrow"><div class="down-caret"></div></div>');


// -------------- DEFAULT HC SCRIPT ------------ //
  // social share popups
  $(".share a").click(function(e) {
    e.preventDefault();
    window.open(this.href, "", "height = 500, width = 500");
  });

  // toggle the share dropdown in communities
  $(".share-label").on("click", function(e) {
    e.stopPropagation();
    var isSelected = this.getAttribute("aria-selected") == "true";
    this.setAttribute("aria-selected", !isSelected);
    $(".share-label").not(this).attr("aria-selected", "false");
  });

  $(document).on("click", function() {
    $(".share-label").attr("aria-selected", "false");
  });

  // show form controls when the textarea receives focus
  $(".answer-body textarea").one("focus", function() {
    $(".answer-form-controls").show();
  });

  $(".comment-container textarea").one("focus", function() {
    $(".comment-form-controls").show();
  });

});