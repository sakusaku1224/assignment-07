document.addEventListener("turbo:load", function () {
  const config = {
    dateFormat: "Y/m/d",
    locale: {
      months: {
        shorthand: [
          "1月",
          "2月",
          "3月",
          "4月",
          "5月",
          "6月",
          "7月",
          "8月",
          "9月",
          "10月",
          "11月",
          "12月",
        ],
        longhand: [
          "1月",
          "2月",
          "3月",
          "4月",
          "5月",
          "6月",
          "7月",
          "8月",
          "9月",
          "10月",
          "11月",
          "12月",
        ],
      },
      weekdays: {
        shorthand: ["日", "月", "火", "水", "木", "金", "土"],
        longhand: [
          "日曜日",
          "月曜日",
          "火曜日",
          "水曜日",
          "木曜日",
          "金曜日",
          "土曜日",
        ],
      },
      firstDayOfWeek: 0,
    },
  };

  const checkIn = document.getElementById("check_in");
  const checkOut = document.getElementById("check_out");

  if (checkIn) flatpickr(checkIn, config);
  if (checkOut) flatpickr(checkOut, config);
});
