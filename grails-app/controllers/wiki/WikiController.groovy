package wiki

class WikiController {


    def index() {
        render view:"index", model: [pages: Page.list()]
    }

    def article(Page article){
        render view:"index", model: [pages: Page.list(),article:article]
    }

    def createPage() {
        Page page = new Page(params)
        render view:"createPage", model: [page:page]

    }

    def deletePage(Page page)
    {
        page?.delete(flush:true)
       redirect controller:"wiki", action:"index"
    }

    def editPage(Page page){


        render view:"editPage",model:[page:page]

    }
    def saveEdit(Page page){
        page?.content = params.content
        page?.title = params.title
        if (page.validate()) {
            page.save(flush: true)
            redirect controller:"wiki", action:"index"
        }
        else
            render page.errors

    }

    def savePage(Page page){


        if (page == null) {
            println("Cette page n'est pas disponible")
            redirect action:"createPage"
            return
        }

        if (page.validate()) {
            page.save()
            println "success $page.content"
        }
        else
            println page.errors


        redirect controller:"wiki", action:"index"
//        redirect action:"createPage"

    }


}
