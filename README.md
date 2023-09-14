<h1 align="center"><img src="https://i.imgur.com/59swfgh.png" width="48px" height="auto"> OP-REQUESTS - Fivem Requests system</h1>

###### Script Futures:
- Easy to use
- Configure Accept/Reject request actions
- Set Header & Description
- Cool Transitions

--- 

###### Script Showcase:
<br>
<a href="https://store.otherplanet.dev"><h1 align="center"><img src="https://i.imgur.com/UDD3g5T.png" width="95%" height="auto"></h1></a>

###### Script Usage:

> **⚠ IMPORTANT: Executed from sender side.**  
> Remember the code is executed from sender side

```lua                   
exports["op-requests"]:sendRequest(playerId, head, description,{
    onReject = function()
      -- What script'll do when the request recipient will reject it
    end, 
    onAccept = function()
      -- What script'll do when the request recipient will accept it
    end
})
```

---

###### Dependencies: 
<a href="[https://store.otherplanet.dev](https://github.com/esx-framework/esx_core)"><img src="https://esx.s3.fr-par.scw.cloud/blanc-800x800.png" width="128px" height="auto"></a>
