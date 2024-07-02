@sample1
Feature: Json Reader

  Scenario: JSON Reader / Parser
    * def jsonObject =
      """
      [
      {
      "name" : "anurag",
      "Age" : 29,
      "City" : "pune"
      },
      {
      "name" : "Nilesh",
      "Age" : 27,
      "City" : "Allahabad"
      }
      ]
      """
    * print jsonObject
    * print jsonObject[0]
    * print jsonObject[0].name
    * print jsonObject[1].name  + " " + jsonObject[1].Age + " " + jsonObject[1].City

  Scenario: Json complex reader
    * def jsonObject =
      """
      [
      {"menu": {
        "id": "file",
        "value": "File",
        "popup": {
          "menuitem": [
            {"value": "New", "onclick": "CreateNewDoc()"},
            {"value": "Open", "onclick": "OpenDoc()"},
            {"value": "Close", "onclick": "CloseDoc()"}
          ]
        }
      }}
      ]
      """
    * print jsonObject
    * print jsonObject[0].menu.id
    * print jsonObject[0].menu.popup.menuitem[0].value
    * print jsonObject[0].menu.popup.menuitem[0].onclick
