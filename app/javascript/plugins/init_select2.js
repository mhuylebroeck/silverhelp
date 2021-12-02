import * as select2 from "select2" ;

const initSelect2 = () => {
  console.log("init select2")
  $(document).ready(function () {
    const selectElem = $('.select-2-suggestions')
    const searchButton = document.querySelector('.search-btn-home');
    selectElem.select2({ placeholder: "Type a task to get help with..."});
    selectElem.on('select2:select', function(e) {
      searchButton.focus();
    })

  });
};

export { initSelect2 };
