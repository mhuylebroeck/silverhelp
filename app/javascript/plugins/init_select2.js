import * as select2 from "select2" ;

const initSelect2 = () => {
  console.log("init select2")
  $(document).ready(function () {
    $('.select-2-suggestions').select2();
    // $('.select-2-suggestions').select2('open');
  });
};

export { initSelect2 };
