package wiki

class Page {

    String title
    String content

    static mapping = {content type:'text'}

    /*static hasOne = [title:Title, content:Content,reference:Reference]*/

    static constraints = {
        title nullable: false
        content widget:'textarea'

    }

    String getString()  { return "toto"}
}
