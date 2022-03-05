import HTMLKit
import XCTest

final class PageTests: XCTestCase {
    
    func testScripting() throws {
        
        let renderer = Renderer()
        
        try renderer.add(view: SampleView())
        
        XCTAssertEqual(try renderer.render(raw: SampleView.self),
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <head>\
                       <title>SamplePage</title>\
                       </head>\
                       <body>\
                       <ul class="list direction:vertical">\
                       <li class="list-row">\
                       <p class="text" id="selector">Test</p>\
                       </li>\
                       </ul>\
                       <script>\
                       $('#selector').onHover(function() {
                           $('#target').show();
                       });\
                       </script>\
                       </body>\
                       </html>
                       """
        )
    }
}
