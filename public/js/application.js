$(document).ready(function() {
  $(".header-wrapper").on("click", ".login-link", (event) => {
    event.preventDefault();
    const url = $(event.target).attr("href");
    $.ajax({
      url
    }).done((response) => {
      $(".login-link").hide();
      $(".header-wrapper").append(response);
    });
  });

  $(".header-wrapper").on("click", ".create-user-link", (event) => {
    event.preventDefault();
    const url = $(event.target).attr("href");
    $.ajax({
      url
    }).done((response) => {
      $(".create-user-link").hide();
      $(".header-wrapper").append(response);
    });
  });
});
