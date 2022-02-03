import XCTest
import HTMLKit
@testable import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    let renderer = Renderer()
    
    func testActionButton() throws {
        
        let view = TestPage {
            ActionButton(style: .primary, uri: "uri") {
                "Button"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="button style:primary" role="button">Button</a>
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
                       <ul class="collection"></ul>
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
                       <li class="collection-item"></li>
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
    
    func testTextField() throws {
        
        let view = TestPage {
            TextField(name: "Name") {
                "TextField"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <textarea id="Name" name="Name" class="input type:text" rows="1">TextField</textarea>
                       """
        )
    }
    
    func testPasswordInput() throws {
        
        let view = TestPage {
            SecureField(name: "Password")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="password" id="Password" name="Password" class="input type:password">
                       """
        )
    }
    
    func testImage() throws {
        
        let view = TestPage {
            ImageView(source: "source")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="image">\
                       <img src="source" role="img">\
                       </div>
                       """
        )
    }
    
    func testList() throws {
        
        let view = TestPage {
            List(direction: .vertical) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="list direction:vertical"></ul>
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
    
    func testLink() throws {
        
        let view = TestPage {
            Link(destination: "uri") {
                "link"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="link">link</a>
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
            Text {
            }
            .fontSize(.large)
            .fontTransformation(.uppercase)
            .foregroundColor(.blue)
            .bold()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p class="text size:large transformation:uppercase color:blue weight:bold"></p>
                       """
        )
    }
}
