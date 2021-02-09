package appwebtfg

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //Home mappings
        "/"(controller: "home", action:"index")

        //Course mappings
        "/course/$id"(controller: "course", action: "getCourse")

        //Error mappings
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
