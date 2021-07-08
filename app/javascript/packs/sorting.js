import SortTableByTitle from "./sort_table_by_title_class";

document.addEventListener('turbolinks:load', function () {
  let control = document.querySelector('.sort-by-title')
  if (control) {
    let sortedTable = new SortTableByTitle(document.querySelector('table'))
    sortedTable.catchEvents(control)
  }
})
