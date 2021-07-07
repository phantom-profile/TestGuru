document.addEventListener('turbolinks:load', function () {
  let control = document.querySelector('.sort-by-title')
  if (control) control.addEventListener('click', sortTableByTitle)
})

function sortTableByTitle() {
  let table = document.querySelector('table')

  // returns NodeList - is nothing common with array struct
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  // all rows except title row
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  let arrowUpClasses = this.querySelector('.octicon-arrow-up').classList
  let arrowDownClasses = this.querySelector('.octicon-arrow-down').classList

  if (arrowUpClasses.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUpClasses.remove('hide')
    arrowDownClasses.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUpClasses.add('hide')
    arrowDownClasses.remove('hide')
  }

  let sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  sortedRows.forEach(function (item) {
    sortedTable.appendChild(item)
  })

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  // querySelector takes first element in row - exactly title
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  // querySelector takes first element in row - exactly title
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 > testTitle2) { return -1 }
  if (testTitle1 < testTitle2) { return 1 }
  return 0
}
