import RowWithForm from "./row_with_form_class"
import TableOfRowsWithForms from "./table_of_rows_with_forms_class"

document.addEventListener('turbolinks:load', function () {
  let controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    let tableWithForms = new TableOfRowsWithForms(document.querySelector('table'))
    tableWithForms.addListenersToRows()
  }

  let errors = document.querySelector('.resource-errors')
  if (errors && controls.length) {
      let resourceId = errors.dataset.resourceId
      let row = new RowWithForm(document.querySelector('.form-inline-link[data-test-id="' + resourceId + '"]')
          // <a> => <td> => <tr>
          .parentNode
          .parentNode)
      row.formInlineHandler()
  }
})
