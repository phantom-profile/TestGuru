import ShowingRuleAttribute from "./show_rule_attribute_class";

document.addEventListener('turbolinks:load', function () {
  let control = document.getElementById('badge_rule')
  if (control) {
    let ruleAttributes = document.querySelectorAll('.rule-attribute')
    let ruleController = new ShowingRuleAttribute(control, ruleAttributes)
    ruleController.catchEvents()
  }
})
