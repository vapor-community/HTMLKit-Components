import XCTest
import HTMLKit
@testable import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    let renderer = Renderer()
    
    func testAvatar() throws {
        
        let view = TestPage {
            Avatar(uri: "uri", size: .medium, status: .available)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="avatar">\
                       <div class="avatar-status status:available">\
                       <img src="uri" class="avatar-image">\
                       </div>\
                       </div>
                       """
        )
    }
    
    func testButton() throws {
        
        let view = TestPage {
            ActionButton(variation: .ghost, size: .large, uri: "uri", id: nil) {
                "Button"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="button variation:ghost size:large" role="button">Button</a>
                       """
        )
    }
    
    func testDropdownButton() throws {
        
        let view = TestPage {
            DropdownButton {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="dropdown"></div>
                       """
        )
    }
    
    func testButtonGroup() throws {
        
        let view = TestPage {
            ButtonGroup {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="button-group"></div>
                       """
        )
    }
    
    func testCollection() throws {
        
        let view = TestPage {
            Collection {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="collection"></div>
                       """
        )
    }
    
    func testCollectionItem() throws {
        
        let view = TestPage {
            CollectionItem {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="collection-item"></div>
                       """
        )
    }
    
    func testFormContainer() throws {
        
        let view = TestPage {
            FormContainer {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <form method="post" class="form"></form>
                       """
        )
    }
    
    func testFormHeader() throws {
        
        let view = TestPage {
            FormHeader {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-header"></div>
                       """
        )
    }
    
    func testFormBody() throws {
        
        let view = TestPage {
            FormBody {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-body"></div>
                       """
        )
    }
    
    func testFormFooter() throws {
        
        let view = TestPage {
            FormFooter {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-footer"></div>
                       """
        )
    }
    
    func testFormRow() throws {
        
        let view = TestPage {
            FormRow {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-row"></div>
                       """
        )
    }
    
    func testFormColumn() throws {
        
        let view = TestPage {
            FormColumn(size: .twelve) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-column size:12"></div>
                       """
        )
    }
    
    func testTextareaInput() throws {
        
        let view = TestPage {
            TextareaInput(title: "title", name: "name", placeholder: .constant(nil)) {
                "Test"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="input-group">\
                       <label class="label">title</label>\
                       <textarea id="name" name="name" class="input type:textarea">Test</textarea>\
                       </div>
                       """
        )
    }
    
    func testTextInput() throws {
        
        let view = TestPage {
            TextInput(title: "title", name: "name", value: .constant(nil), placeholder: .constant(nil))
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="input-group">\
                       <label class="label">title</label>\
                       <input type="text" id="name" name="name" class="input type:text">\
                       </div>
                       """
        )
    }
    
    func testPasswordInput() throws {
        
        let view = TestPage {
            FormBody {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="form-body"></div>
                       """
        )
    }
    
    func testSubmitButton() throws {
        
        let view = TestPage {
            SubmitButton(title: "Submit")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <button type="submit" class="button variation:primary" role="button">Submit</button>
                       """
        )
    }
    
    func testResetButton() throws {
        
        let view = TestPage {
            ResetButton(title: "Reset")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <button type="reset" class="button variation:secondary" role="button">Reset</button>
                       """
        )
    }
    
    func testImage() throws {
        
        let view = TestPage {
            ImageContainer(uri: "source")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="image">\
                       <img src="source" alt="thumbnail">\
                       </div>
                       """
        )
    }
    
    func testListContainer() throws {
        
        let view = TestPage {
            ListContainer {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="list"></div>
                       """
        )
    }
    
    func testListHeader() throws {
        
        let view = TestPage {
            ListHeader {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="list-header"></div>
                       """
        )
    }
    
    func testListBody() throws {
        
        let view = TestPage {
            ListBody {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="list-body"></ul>
                       """
        )
    }
    
    func testListRow() throws {
        
        let view = TestPage {
            ListRow {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <li class="list-row"></li>
                       """
        )
    }
    
    func testListColumn() throws {
        
        let view = TestPage {
            ListColumn(size: .twelve) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="list-column size:12 alignment:left"></div>
                       """
        )
    }
    
    func testListFooter() throws {
        
        let view = TestPage {
            ListFooter {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="list-footer"></div>
                       """
        )
    }
    
    func testNavigation() throws {
        
        let view = TestPage {
            NavigationContainer(direction: .horizontal) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="navigation direction:horizontal"></ul>
                       """
        )
    }
    
    func testNavigationItem() throws {
        
        let view = TestPage {
            NavigationItem(isActive: true) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <li class="navigation-item active"></li>
                       """
        )
    }
    
    func testNavigationLink() throws {
        
        let view = TestPage {
            NavigationLink(uri: "uri", id: nil) {
                "link"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="navigation-link">link</a>
                       """
        )
    }
    
    func testStack() throws {
        
        let view = TestPage {
            Stack(direction: .horizontal) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="stack direction:horizontal"></div>
                       """
        )
    }
    
    func testStackColumn() throws {
        
        let view = TestPage {
            StackColumn(size: .twelve) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="stack-column size:12"></div>
                       """
        )
    }
    
    func testText() throws {
       
        let view = TestPage {
            Text(size: .large, weight: .bold, transformation: .normal) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p class="text size:large weight:bold transformation:normal"></p>
                       """
        )
    }
    
    func testTabs() throws {
       
        let view = TestPage {
            TabGroup {
                TabItem {
                    Span {
                        "Hallo"
                    }
                }
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="tab-group">\
                       <li class="tab-item">\
                       <span>Hallo</span>\
                       </li>\
                       </ul>
                       """
        )
    }
}
