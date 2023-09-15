
<h1 align="center"><img src="https://i.imgur.com/59swfgh.png" width="48px" height="auto"> OP-REQUESTS - Fivem Requests system</h1>

###### Join Our Discord!!!
> 🛠 Fast Support <br>
> 📥 Report Bugs <br>
> 🗒 Chat with our Community!
<a href="https://discord.gg/bagieta">
<img src="https://image.jimcdn.com/app/cms/image/transf/none/path/sd0ac3cec7e1354b8/image/i9a5907048ddc7a76/version/1505635416/image.png" width="50%" height="auto">
</a>

---

###### Script Futures:
- Easy to use
- Configure Accept/Reject request actions
- Set Header & Description
- Cool Transitions

--- 

###### Script Showcase:
<br>
<p align="center">https://www.youtube.com/watch?v=Vqwpo2VABjU</p>
<a href="https://www.youtube.com/watch?v=Vqwpo2VABjU"><h1 align="center"><img src="https://i.ytimg.com/vi/Vqwpo2VABjU/maxresdefault.jpg" width="95%" height="auto"></h1></a>

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
