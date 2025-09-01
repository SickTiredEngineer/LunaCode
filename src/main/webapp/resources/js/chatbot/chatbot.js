$(function(){
	
	const chatScroll = document.getElementById('chatScroll');
	const composer = document.getElementById('composer');
	const sendBtn = document.getElementById('sendBtn');
	const typing = document.getElementById('typing');
	
	function ts(){
		const d = new Date();
		return d.toLocaleTimeString('ko-KR', {hour:'2-digit', minute:'2-digit'});
	}
	
	function addMessage(role, text){
		const wrap = document.createElement('div');
		wrap.className = 'msg ' + (role === 'user' ? 'me' : 'bot');
		
		const avatar = document.createElement('div');
		avatar.className = 'avatar';

		if (role === 'user') {
		  avatar.textContent = (window.me?.nickname || window.me?.userId || 'Guest');
		} else {
		  avatar.textContent = '루나챗봇';
		}

		const body = document.createElement('div');
		const bubble = document.createElement('div');
		bubble.className = 'bubble';
		bubble.textContent = text;
		const stamp = document.createElement('div');
		stamp.className = 'timestamp';
		stamp.textContent = ts();
		
		body.appendChild(bubble); body.appendChild(stamp);
		wrap.appendChild(avatar); wrap.appendChild(body);
		chatScroll.appendChild(wrap);
		chatScroll.scrollTop = chatScroll.scrollHeight;
		return bubble; // return node for streaming updates
	}
	
	
	// Fake stream renderer for any backend that supports chunked text
	function streamInto(node){
		return (chunk)=>{ node.textContent += chunk; chatScroll.scrollTop = chatScroll.scrollHeight; };
	}
	
	async function sendMessage(){
		const text = composer.value.trim();
		if(!text) return;
		composer.value = '';
		
		addMessage('user', text);
		
		typing.style.display = 'inline-flex';
		sendBtn.disabled = true;

		try {
		    const reply = await $.ajax({
		      type: 'POST',
		      url: 'AskToGPT',
		      dataType: 'text',         
		      data: { prompt: text }
		    });
		    addMessage('assistant', reply || '(응답이 없습니다)');
		  } catch (e) {
		    addMessage('assistant', '오류가 발생했어요. 잠시 후 다시 시도해주세요.');
		    console.error(e);
		  } finally {
		    typing.style.display = 'none';
		    sendBtn.disabled = false;
		  }
	}
	
	sendBtn.addEventListener('click', sendMessage);
	composer.addEventListener('keydown', (e)=>{
		if(e.key === 'Enter' && !e.shiftKey){ e.preventDefault(); sendMessage(); }
	});
	
	document.querySelectorAll('[data-ts]').forEach(el => el.textContent = ts());

});
	
	




