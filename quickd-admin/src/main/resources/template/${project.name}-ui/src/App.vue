<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
    export default {
        name: 'app',
        mounted () {
            // 加载友盟js
            const script = document.createElement('script')
            script.src = 'https://s95.cnzz.com/z_stat.php?id=1278076125&web_id=1278076125'
            document.body.appendChild(script)
        },
        watch: {
            $route () {
                // 路由变化交互统计数据
                if (window._czc) {
                    let location = window.location
                    let contentUrl = location.pathname + location.hash
                    let refererUrl = '/'
                    window._czc.push(['_trackPageview', contentUrl, refererUrl])
                }
            }
        }
    }
</script>
