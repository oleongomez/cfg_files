local M = {}

function M.get_virtual_env()
    local virtual_env = os.getenv('VIRTUAL_ENV')
    if(virtual_env ~= nil )then
        return virtual_env .. "/bin/python"
    end
    return nil

end

return M
