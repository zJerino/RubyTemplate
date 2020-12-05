/**
 *	CHATBOX MODULE
 *	By Xemah | https://xemah.com
 *	Ruby Template | https://cuberico.xyz/Ruby/
 *
**/

var siteURL = FRONTEND_CON.SITE_HOME;
function GetTemplate() {
  console.debug('Creando Chatbox')
  if ($.cookie('minimizado') == "true") {
      console.debug('[CHATBOX] SE ELIGIO MINIMIZADO')
      var respon = `<div class="card direct-chat direct-chat-primary ${widget_card}" id="chatbox">
      <div class="card-header">
        <h3 class="card-title">{chatboxTitle}</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse" onclick="ChangeChatboxMode()">
            <i class="fas fa-minus"></i>
          </button>
          <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
          </button>
        </div>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <!-- Conversations are loaded here -->
        <div class="direct-chat-messages" id="chatbox_container">
            {chatboxLoading}
        </div>
      </div>
      <!-- /.card-body -->
      <div class="card-footer">
        <form action="" class="disabled" id="chatForm" autocomplete="off" method="post">
          <div class="input-group">
            <input type="text" name="message" id="chatInput" placeholder="{chatboxMessagePlaceholder}" class="form-control">
            <span class="input-group-append">
              <button type="submit" id="chatInputSubmit" class="btn btn-primary" onclick="BorrarTexto()" onsubmit="BorrarTexto()"><i class="fa fa-paper-plane"></i></button>
            </span>
          </div>
        </form>
      </div>
      <!-- /.card-footer-->
    </div>`;
  } else {
      console.debug('[CHATBOX] SE ELIGIO EXPANDIDO')
      var respon = `<div class="card direct-chat direct-chat-primary collapsed-card ${widget_card}" id="chatbox">
      <div class="card-header">
        <h3 class="card-title">{chatboxTitle}</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse" onclick="ChangeChatboxMode()">
            <i class="fas fa-plus"></i>
          </button>
          <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
          </button>
        </div>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <!-- Conversations are loaded here -->
        <div class="direct-chat-messages" id="chatbox_container">
            {chatboxLoading}
        </div>
      </div>
      <!-- /.card-body -->
      <div class="card-footer">
        <form action="" class="disabled" id="chatForm" autocomplete="off" method="post">
          <div class="input-group">
            <input type="text" name="message" id="chatInput" placeholder="{chatboxMessagePlaceholder}" class="form-control">
            <span class="input-group-append">
              <button type="submit" id="chatInputSubmit" class="btn btn-primary" onclick="BorrarTexto()" onsubmit="BorrarTexto()"><i class="fa fa-paper-plane"></i></button>
            </span>
          </div>
        </form>
      </div>
      <!-- /.card-footer-->
    </div>`;
  }
  return respon
}

function ChangeChatboxMode() {
  if ($.cookie('minimizado') == "true") {
    $.cookie('minimizado', "false");
  } else if ($.cookie('minimizado') == "false") {
    $.cookie('minimizado', "true");
  } else {
    $.cookie('minimizado', "false");
  }
}

function getitemTemplate() {
            return `
            <div class="direct-chat-msg" id="chatMessage-{messageId}">
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left"><a href="{authorProfile}" style="{authorStyle}">{authorUsername}</a></span>
                    <span class="direct-chat-timestamp float-right" title="{messageTimeFull}">{messageTime}</span>
                </div>
                <img class="direct-chat-img" src="{authorAvatar}" alt="{authorUsername}">
                <div class="direct-chat-text">
                    {messageContent}
                </div>
                    {messageActions}
            </div>`;
}
var chatbox = {
	template: GetTemplate(),
    itemTemplate: getitemTemplate(),
	elements: {
		containerTop: '#container-content > #content-general',
		containerBottom: '#container-content > #content-general',
		root: '#chatbox',
		log: '#chatbox #chatbox_container',
		form: '#chatbox #chatForm',
		input: '#chatbox #chatInput'
	},

	style: `
		#chatbox {
			margin-bottom: 1.5rem;
		}
		#chatbox #chatLog {
			height: 250px;
			max-width: 100%;
			overflow-y: scroll;
		}
		#chatbox #chatForm.disabled {
			opacity: 0.75;
		}
		#chatbox #chatForm.disabled * {
			pointer-events: none;
		}
	`

}
function BorrarTexto() {
  setTimeout(() => {
    var chido = $('#chatbox #chatInput')[0];
    chido.value = "";
  }, 500)
}