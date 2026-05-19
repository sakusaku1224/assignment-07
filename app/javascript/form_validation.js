document.addEventListener("turbo:load", function () {
  document.querySelectorAll("form[novalidate]").forEach(function (form) {
    form.addEventListener("submit", function (e) {
      let hasError = false;

      // メールアドレスのチェック
      const emailField = form.querySelector('input[type="email"]');
      if (emailField) {
        const existingError = emailField.parentNode.querySelector(".email-error");
        if (existingError) existingError.remove();

        if (emailField.value.length === 0) {
          e.preventDefault();
          hasError = true;
          const error = document.createElement("p");
          error.className = "text-danger email-error";
          error.textContent = "メールアドレスを入力してください";
          emailField.insertAdjacentElement("afterend", error);
        } else if (emailField.validity.typeMismatch) {
          e.preventDefault();
          hasError = true;
          const error = document.createElement("p");
          error.className = "text-danger email-error";
          error.textContent = "メールアドレスの形式が正しくありません";
          emailField.insertAdjacentElement("afterend", error);
        }
      }

      // パスワードのチェック
      const passwordField = form.querySelector('input[type="password"]');
      if (passwordField) {
        const existingError = passwordField.parentNode.querySelector(".password-error");
        if (existingError) existingError.remove();

        if (passwordField.value.length === 0) {
          e.preventDefault();
          hasError = true;
          const error = document.createElement("p");
          error.className = "text-danger password-error";
          error.textContent = "パスワードを入力してください";
          passwordField.insertAdjacentElement("afterend", error);
        }
      }
    });
  });
});
