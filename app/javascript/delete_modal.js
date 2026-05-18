document.addEventListener("turbo:load", function () {
  const deleteModal = document.getElementById("deleteModal");
  if (!deleteModal) return;
  if (deleteModal.dataset.listenerAdded) return;
  deleteModal.dataset.listenerAdded = "true";

  deleteModal.addEventListener("show.bs.modal", function (event) {
    const button = event.relatedTarget;
    const url = button.getAttribute("data-delete-url");
    document.getElementById("deleteConfirmBtn").closest("form").action = url;

    const name = button.getAttribute("data-delete-name");
    const checkIn = button.getAttribute("data-delete-checkin");
    const checkOut = button.getAttribute("data-delete-checkout");
    const personNum = button.getAttribute("data-delete-person-num");
    const totalPrice = button.getAttribute("data-delete-total-price");

    document.getElementById("deleteModalBody").innerHTML = `${name}<br>
      ${checkIn} 〜 ${checkOut}<br>
      ${personNum}人<br>
      ¥${totalPrice}`;
  });
});

document.addEventListener("turbo:before-cache", function () {
  document.querySelectorAll(".modal-backdrop").forEach((el) => el.remove());
  document.body.classList.remove("modal-open");
  document.body.style.removeProperty("overflow");
  document.body.style.removeProperty("padding-right");
});
