$(document).ready(function() {
  $(".header-wrapper").on("click", ".login-link", (event) => {
    event.preventDefault();
    const url = $(event.target).attr("href");
    $.ajax({
      url
    }).done((response) => {
      $(".login-link").hide();
      $(".header-wrapper").append(response);
      $(".new-session").addClass("new-session-ajax");
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
      $(".new-user").addClass("new-user-ajax");
    });
  });

  $(".header-wrapper").on("submit", ".new-session", (event) => {
    event.preventDefault();
    const url = $(event.target).attr("action");
    const data = $(event.target).serialize();
    $.ajax({
      url,
      data,
      method: "POST"
    }).done((response) => {
      if (response.includes("login-error")) {
        $(".header-wrapper").append(response);
      } else {
        window.location.href = response;
      };
    });
  });

  $(".header-wrapper").on("submit", ".new-user", () => {
    event.preventDefault();
    const url = $(event.target).attr("action");
    const data = $(event.target).serialize();
    $.ajax({
      url,
      data,
      method: "POST"
    }).done((response) => {
      console.log(response)
    });
  });
});
