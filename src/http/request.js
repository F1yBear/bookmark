import axios from 'axios'
//超时时间
axios.defaults.timeout = 50000
//跨域凭证
axios.defaults.withCredentials = false
axios.defaults.baseURL = import.meta.env.VITE_BASE_URL

//响应和请求 拦截器配置

export default axios
