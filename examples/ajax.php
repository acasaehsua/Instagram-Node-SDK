<?php 
header("Access-Control-Allow-Origin: *");
	class API {

		function __construct(){
		}
		
		public static function send($url, $type, $data){
			$header = array(
				'Content_type: application/x-www-form-urlencoded'
			);

			$return = array();
			$return['url'] = self::generateUrl($url, $data);
			$return['header'] = $header;
			$return['data'] = $data;

			try{
				$return['result'] = self::curl( $return['url'], $type, $header, $data );
			}catch(Exception $e){
				$return['error'] = $e->getMessage();
			}
			die(json_encode($return));
		}	

		private static function generateUrl($url, $data){
			$endpoint = 'https://api.instagram.com/v1';
			$url = $endpoint . $url;
			// $url = $endpoint . $url . '?';
			// $keys = array_keys($data);
			// foreach ($keys as $key ) {
			// 	$url .= $key . '=' . $data[$key] . '&';
			// }
			return $url;
		}

		private static function curl($url, $type, $header, $data = null){
		    $ch = curl_init();

		    // 设置请求的URL链接
		    curl_setopt($ch, CURLOPT_URL, $url);

		    // 设置请求类型
		    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $type);

		    // 设置请求Header信息
		    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);

		    // 跳过证书验证
		    curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);

		    // 返回响应内容
		    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

		    // 传递POST或PUT请求数据
		    if ($type == 'POST' || $type =='PUT') {
		        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);            
		    }

		    $result = curl_exec($ch);

		    curl_close($ch);  
		    
		    // 返回Decode之后的数据
		    return json_decode($result);
		}
	}

	if(isset($_POST)){
		$url = $_POST['url'];
		$type = $_POST['method'];
		$data = $_POST['params'];
		API::send( $url, $type, $data );
	}
 ?>