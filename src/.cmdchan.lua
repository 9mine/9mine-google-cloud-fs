class "gcloud_cmdchan"("cmdchan")

function gcloud_cmdchan:gcloud_cmdchan(connection, cmdchan_path)
    cmdchan:cmdchan(connection, cmdchan_path)
end

function gcloud_cmdchan:write(command)
    local conn = self.connection.conn
    local f = conn:newfid()
    print("Write " .. command .. " to " .. self.cmdchan_path)
    conn:walk(conn.rootfid, f, self.cmdchan_path)
    conn:open(f, 1)
    local buf = data.new(command)
    conn:write(f, 0, buf)
    conn:clunk(f)
end

function gcloud_cmdchan:execute(command, location)
    local tmp_file = "/n/cmdchan/cmdchan_output"
    pcall(gcloud_cmdchan.write, self, command, location)
    return select(2, pcall(gcloud_cmdchan.read, self, tmp_file))
end
platform.cmdchan = gcloud_cmdchan(platform.connection, core_conf:get("cmdchan_path"))
