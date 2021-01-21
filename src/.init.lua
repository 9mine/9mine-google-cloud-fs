local function set_texture(entry, entity)
    local prefix = init_path:match("/$") and init_path:sub(1, -2) or init_path
    if not prefix then
        return
    end
    if entry.platform_string == prefix .. "/compute/instances/describe" then
        texture.download("https://cloudacademy.com/wp-content/uploads/2014/04/ComputeEngine_512px-300x300.png", true,
            "9mine-google-cloud-fs.png", "9mine-google-cloud-fs")
        entity:set_properties({
            visual = "cube",
            textures = {"9mine-google-cloud-fs.png", "9mine-google-cloud-fs.png", "9mine-google-cloud-fs.png",
                        "9mine-google-cloud-fs.png", "9mine-google-cloud-fs.png", "9mine-google-cloud-fs.png"}
        })
    end
end
register.add_texture_handler("9mine-google-cloud-fs-set-texture", set_texture)