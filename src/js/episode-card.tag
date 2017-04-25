<episode-card class="{card: true, virtual: epData(episode).virtual}"
              id="ep-{episode}">
    <header class="card-header">
        <p class="card-header-title">
            <virtual if="{epData(episode).link}">
                <a href="{epData(episode).link}">
                    {episode}: {epData(episode).title}</a>
            </virtual>
            <virtual if="{!epData(episode).link}">
                {epData(episode).title}
            </virtual>
        </p>
        <p class="card-header-icon"
           if="{!epData(episode).virtual}"
           data-is="seasons"
           episode="{episode}">
        </p>
        <p class="card-header-icon card-eye-icon">
            <a onclick="{toggle}" title="Show episode commentary" if="{epData(episode).collapse}">
                <span class="icon _icon">h</span></a>
            <a onclick="{toggle}" title="Hide episode commentary" if="{!epData(episode).collapse}">
                <span class="icon _icon">g</span></a>
        </p>
    </header>
    <div class="{'card-content': true, 'is-clearfix': true, collapse: epData(episode).collapse}">
        <div class="card-move-block is-pulled-right">
            <div class="field is-grouped">
                <p class="control">
                    <button class="button button-up is-success is-outlined"
                    disabled="{!parent.canMove(index, episode, -1)}"
                            title="Earlier"
                            onclick="{parent.moveUp}">
                        <span class="icon"><i class="_icon">f</i></span>
                    </button>
                </p>
                <p class="control">
                    <button class="button button-down is-success is-outlined"
                            disabled="{!parent.canMove(index, episode, 1)}"
                            title="Later"
                            onclick="{parent.moveDown}">
                        <span class="icon"><i class="_icon">e</i></span>
                    </button>
                </p>
            </div>
        </div>
        <div class="content episode-comment">
            <p class="big-season-icon is-pulled-left"
               data-is="seasons"
               skip="true"
               episode="{episode}"
               if="{epData(episode).virtual}"></p>
            <raw-html text="{epData(episode).html}" />
        </div>
        <div if="{after(episode)}"
             class="blockers">
            Must follow:
            <ul data-is="episode-blocker-list"
                list="{after(episode)}"></ul>
        </div>
        <div if="{before(episode)}"
             class="blockers">
            Must precede:
            <ul data-is="episode-blocker-list"
                list="{before(episode)}"></ul>
        </div>
    </div>
    <script>
        import "./raw-html.tag";
        import "./episode-blocker-list.tag";
        import "./seasons.tag";

        this.toggle = e => {
            this.epData(this.episode).collapse = !this.epData(this.episode).collapse;
        };

        this.listen('collapse-change', data => {
            this.epData(this.episode).collapse = data;
            this.update();
        });

    </script>
</episode-card>
