
provider "github" {
  token = "Provide_token"
  }

resource "github_repository" "example"{
    name = "demorepo"
    description = "repository from terraform script"
    visibility = "public"

}
