
variable "APP_VER" {
  default = "20.16"
}

variable "APP_VER_BUILD" {
  default = "1"
}

variable "APP_BUILD_COMMIT" {
  default = "0000000"
}

variable "APP_DEBUG" {
  default = "0"
}

variable "APP_BUILD_DATE" {
  default = "${formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())}"
}

# variable "ASTERISK_VER" {
#   default = "20.x"
# }

# variable "FREEPBX_VER" {
#   default = "20.x"
# }


group "default" {
  targets = ["izpbx"]
}

target "izpbx" {
  platforms = ["linux/amd64"]
  context = "./izpbx-asterisk/"
  dockerfile = "Dockerfile"
  args = {
    APP_VER = "${APP_VER}"
    APP_VER_BUILD = "${APP_VER_BUILD}"
    APP_DEBUG = "${APP_DEBUG}"
    APP_BUILD_COMMIT = "${APP_BUILD_COMMIT}"
    APP_BUILD_DATE = "${APP_BUILD_DATE}"
  }
  labels = {
    "org.opencontainer.image.authors" = "MaWe <https://github.com/hobbit378>"
    "org.opencontainer.image.version" = "${APP_VER}"
    "org.opencontainer.image.created" = "${APP_BUILD_DATE}"
    "org.opencontainer.image.url" = "https://hub.docker.com/r/hobbit00378/izpbx-asterisk"
    "org.opencontainer.image.source" = "https://github.com/hobbit378/docker-izpbx"
  }
  tags = [
            "docker.io/hobbit00378/izpbx-asterisk:${APP_VER}",
            "docker.io/hobbit00378/izpbx-asterisk:latest",
            "ghcr.io/hobbit378/izpbx-asterisk:${APP_VER}",
            "ghcr.io/hobbit378/izpbx-asterisk:latest"
          ]

}

