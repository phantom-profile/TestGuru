export default class ShowingRuleAttribute {
  constructor(ruleSelector, ruleAttributes) {
    this.selectorField = ruleSelector
    this.attributes = ruleAttributes
  }

  showingChosen = () => {
    this.selectedIndex = this.selectorField.selectedIndex
    for (let i = 0; i < this.attributes.length; i++) {
      if (i === this.selectedIndex - 1) {
        this.attributes[i].classList.remove('hide')
      } else {
        this.attributes[i].classList.add('hide')
      }
    }
  }

  catchEvents = () => {
    this.selectorField.addEventListener('change', () => this.showingChosen())
  }
}