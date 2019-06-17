package com.cg.digi.utilities;

import java.io.IOException;
import java.net.MalformedURLException;



import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;

public class jenkbuild_testing {
	private static String JenkinsAuthenticationUserName = "admin";
	private static String JenkinsAuthenticationPassword = "admin123";

	public static void JenkinsRemoteAPIBuild() throws AuthenticationException, IOException {
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(
				"http://localhost:8080/job/jon/build");

		UsernamePasswordCredentials creds = new UsernamePasswordCredentials(JenkinsAuthenticationUserName,
				JenkinsAuthenticationPassword);
		httpPost.addHeader(new BasicScheme().authenticate(creds, httpPost, null));
		httpPost.addHeader("Content-type", "application/json");
		httpPost.addHeader("Accept", "application/json");
		System.out.println("posting: " + httpPost);
		CloseableHttpResponse response = client.execute(httpPost);
		System.out.println((response.getStatusLine().getStatusCode()));
		System.out.println("Response: " + response);
		client.close();
	}

	public static void main(String[] args) throws AuthenticationException, ClientProtocolException, IOException {
		JenkinsRemoteAPIBuild();
	}

}
