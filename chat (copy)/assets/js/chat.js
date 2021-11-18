import { Socket, Presence } from 'phoenix'

class Chat {
    constructor(roomName) {
        this.presences = {}
        this.roomName = roomName
        this.userList = document.getElementById('user-list')
        this.formatPresences = this.formatPresences.bind(this)
        this.renderPresences = this.renderPresences.bind(this)
        this.messageInput = document.getElementById('new-message')
        this.messageList = document.getElementById('message-list')
        this.renderMessage = this.renderMessage.bind(this)
    }

    initialize() {
        // Ask for user's name
        this.user = window.prompt('What is your name?') || 'Anonymous'

        // Set up the web socket connection
        this.socket = new Socket('/socket', { params: { user: this.user } })
        this.socket.connect()

        // Set up room
        this.room = this.socket.channel(this.roomName)
        // Sync presence state
        this.room.on('presence_state', state => {
            this.presences = Presence.syncState(this.presences, state)
            this.renderPresences(this.presences)
        })

        this.room.on('presence_diff', state => {
            this.presences = Presence.syncDiff(this.presences, state)
            this.renderPresences(this.presences)
        })

        // Setup new message handler
        this.room.on('message:new', this.renderMessage)
        this.room.on('messages:recent', ({data: messages}) => {
            messages.map(this.renderMessage)
        })

        this.messageInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter' && this.messageInput != '') {
                this.room.push('message:new', this.messageInput.value)
                this.messageInput.value = ''
            }
        })

        // Join the room
        this.room.join()
    }

    formatPresences(presences) {
        return Presence.list(presences, (user, { metas }) => {
            return {
                user: user,
                onlineAt: this.formatTimestamp(metas[0].online_at)
            }
        })
    }

    formatTimestamp(timestamp) {
        let date = new Date(timestamp)
        return date.toLocaleTimeString()
    }

    renderPresences(presences) {
        let html = this.formatPresences(presences).map(presence => `
        <li>
            ${presence.user}
            <br />
            <small>online since ${presence.onlineAt}</small>
        </li>
        `).join('')

        this.userList.innerHTML = html
    }

    renderMessage(message) {
        let messageElement = document.createElement('li')
        messageElement.innerHTML = `
            <b>${message.user}</b>
            <i>${this.formatTimestamp(message.timestamp)}</i>
            <p>${message.body}</p>
        `
        this.messageList.appendChild(messageElement)
        this.messageList.scrollTop = this.messageList.scrollHeight
    }
}

export default Chat