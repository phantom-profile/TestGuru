import RowWithForm from "./row_with_form_class"

export default class TableOfRowsWithForms {
  constructor(table) {
    let rows = Array.from(table.querySelectorAll('tr')).slice(1)
    this.rows = []
    rows.forEach( (row) => {
      this.rows.push(new RowWithForm(row))
    })
  }

  addListenersToRows() {
    this.rows.forEach( (row) => {
      row.addListenerToLink()
    })
  }
}