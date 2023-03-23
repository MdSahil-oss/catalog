package main

olmResources: {
	type: "k8s-objects"
	name: "olm-resources"
	properties: {
		objects: [
			{
				"kind":       "ClusterRole"
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"metadata": {
					"name": "aggregate-olm-edit"
					"labels": {
						"rbac.authorization.k8s.io/aggregate-to-admin": "true"
						"rbac.authorization.k8s.io/aggregate-to-edit":  "true"
					}
				}
				"rules": [
					{
						"apiGroups": [
							"operators.coreos.com",
						]
						"resources": [
							"subscriptions",
						]
						"verbs": [
							"create",
							"update",
							"patch",
							"delete",
						]
					},
					{
						"apiGroups": [
							"operators.coreos.com",
						]
						"resources": [
							"clusterserviceversions",
							"catalogsources",
							"installplans",
							"subscriptions",
						]
						"verbs": [
							"delete",
						]
					},
				]
			},
			{
				"kind":       "ClusterRole"
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"metadata": {
					"name": "aggregate-olm-view"
					"labels": {
						"rbac.authorization.k8s.io/aggregate-to-admin": "true"
						"rbac.authorization.k8s.io/aggregate-to-edit":  "true"
						"rbac.authorization.k8s.io/aggregate-to-view":  "true"
					}
				}
				"rules": [
					{
						"apiGroups": [
							"operators.coreos.com",
						]
						"resources": [
							"clusterserviceversions",
							"catalogsources",
							"installplans",
							"subscriptions",
							"operatorgroups",
						]
						"verbs": [
							"get",
							"list",
							"watch",
						]
					},
					{
						"apiGroups": [
							"packages.operators.coreos.com",
						]
						"resources": [
							"packagemanifests",
							"packagemanifests/icon",
						]
						"verbs": [
							"get",
							"list",
							"watch",
						]
					},
				]
			},
			{
				"apiVersion": "apps/v1"
				"kind":       "Deployment"
				"metadata": {
					"name": "catalog-operator"
					"labels": {
						"app": "catalog-operator"
					}
				}
				"spec": {
					"strategy": {
						"type": "RollingUpdate"
					}
					"replicas": 1
					"selector": {
						"matchLabels": {
							"app": "catalog-operator"
						}
					}
					"template": {
						"metadata": {
							"labels": {
								"app": "catalog-operator"
							}
						}
						"spec": {
							"securityContext": {
								"runAsNonRoot": true
								"seccompProfile": {
									"type": "RuntimeDefault"
								}
							}
							"serviceAccountName": "olm-operator-serviceaccount"
							"containers": [
								{
									"name": "catalog-operator"
									"securityContext": {
										"allowPrivilegeEscalation": false
										"capabilities": {
											"drop": [
												"ALL",
											]
										}
									}
									"command": [
										"/bin/catalog",
									]
									"args": [
										"--namespace",
										"olm",
										"--configmapServerImage=quay.io/operator-framework/configmap-operator-registry:latest",
										"--util-image",
										"quay.io/operator-framework/olm@sha256:f9ea8cef95ac9b31021401d4863711a5eec904536b449724e0f00357548a31e7",
										"--set-workload-user-id=true",
									]
									"image":           "quay.io/operator-framework/olm@sha256:f9ea8cef95ac9b31021401d4863711a5eec904536b449724e0f00357548a31e7"
									"imagePullPolicy": "IfNotPresent"
									"ports": [
										{
											"containerPort": 8080
											"name":          "metrics"
										},
									]
									"livenessProbe": {
										"httpGet": {
											"path":   "/healthz"
											"port":   8080
											"scheme": "HTTP"
										}
									}
									"readinessProbe": {
										"httpGet": {
											"path":   "/healthz"
											"port":   8080
											"scheme": "HTTP"
										}
									}
									"terminationMessagePolicy": "FallbackToLogsOnError"
									"resources": {
										"requests": {
											"cpu":    "10m"
											"memory": "80Mi"
										}
									}
								},
							]
							"nodeSelector": {
								"kubernetes.io/os": "linux"
							}
						}
					}
				}
			},
			{
				"apiVersion": "operators.coreos.com/v1"
				"kind":       "OperatorGroup"
				"metadata": {
					"name": "global-operators"
				}
			},
			{
				"apiVersion": "operators.coreos.com/v1"
				"kind":       "OLMConfig"
				"metadata": {
					"name": "cluster"
				}
			},
			{
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"kind":       "ClusterRoleBinding"
				"metadata": {
					"name": "olm-operator-binding-olm"
				}
				"roleRef": {
					"apiGroup": "rbac.authorization.k8s.io"
					"kind":     "ClusterRole"
					"name":     "system:controller:operator-lifecycle-manager"
				}
				"subjects": [
					{
						"kind": "ServiceAccount"
						"name": "olm-operator-serviceaccount"
                        "namespace": parameter.namespace
					},
				]
			},
			{
				"kind":       "ServiceAccount"
				"apiVersion": "v1"
				"metadata": {
					"name": "olm-operator-serviceaccount"
				}
			},
			{
				"apiVersion": "apps/v1"
				"kind":       "Deployment"
				"metadata": {
					"name": "olm-operator"
					"labels": {
						"app": "olm-operator"
					}
				}
				"spec": {
					"strategy": {
						"type": "RollingUpdate"
					}
					"replicas": 1
					"selector": {
						"matchLabels": {
							"app": "olm-operator"
						}
					}
					"template": {
						"metadata": {
							"labels": {
								"app": "olm-operator"
							}
						}
						"spec": {
							"securityContext": {
								"runAsNonRoot": true
								"seccompProfile": {
									"type": "RuntimeDefault"
								}
							}
							"serviceAccountName": "olm-operator-serviceaccount"
							"containers": [
								{
									"name": "olm-operator"
									"securityContext": {
										"allowPrivilegeEscalation": false
										"capabilities": {
											"drop": [
												"ALL",
											]
										}
									}
									"command": [
										"/bin/olm",
									]
									"args": [
										"--namespace",
										"$(OPERATOR_NAMESPACE)",
										"--writeStatusName",
										"",
									]
									"image":           "quay.io/operator-framework/olm@sha256:f9ea8cef95ac9b31021401d4863711a5eec904536b449724e0f00357548a31e7"
									"imagePullPolicy": "IfNotPresent"
									"ports": [
										{
											"containerPort": 8080
											"name":          "metrics"
										},
									]
									"livenessProbe": {
										"httpGet": {
											"path":   "/healthz"
											"port":   8080
											"scheme": "HTTP"
										}
									}
									"readinessProbe": {
										"httpGet": {
											"path":   "/healthz"
											"port":   8080
											"scheme": "HTTP"
										}
									}
									"terminationMessagePolicy": "FallbackToLogsOnError"
									"env": [
										{
											"name": "OPERATOR_NAMESPACE"
											"valueFrom": {
												"fieldRef": {
													"fieldPath": "metadata.namespace"
												}
											}
										},
										{
											"name":  "OPERATOR_NAME"
											"value": "olm-operator"
										},
									]
									"resources": {
										"requests": {
											"cpu":    "10m"
											"memory": "160Mi"
										}
									}
								},
							]
							"nodeSelector": {
								"kubernetes.io/os": "linux"
							}
						}
					}
				}
			},
			{
				"apiVersion": "operators.coreos.com/v1"
				"kind":       "OperatorGroup"
				"metadata": {
					"name": "olm-operators"
				}
				"spec": {
					"targetNamespaces": [
						"olm",
					]
				}
			},
			{
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"kind":       "ClusterRole"
				"metadata": {
					"name": "system:controller:operator-lifecycle-manager"
				}
				"rules": [
					{
						"apiGroups": [
							"*",
						]
						"resources": [
							"*",
						]
						"verbs": [
							"*",
						]
					},
					{
						"nonResourceURLs": [
							"*",
						]
						"verbs": [
							"*",
						]
					},
				]
			},
			{
				"apiVersion": "operators.coreos.com/v1alpha1"
				"kind":       "CatalogSource"
				"metadata": {
					"name": "operatorhubio-catalog"
				}
				"spec": {
					"sourceType":  "grpc"
					"image":       "quay.io/operatorhubio/catalog:latest"
					"displayName": "Community Operators"
					"publisher":   "OperatorHub.io"
					"grpcPodConfig": {
						"securityContextConfig": "restricted"
					}
					"updateStrategy": {
						"registryPoll": {
							"interval": "60m"
						}
					}
				}
			},
			{
				"apiVersion": "operators.coreos.com/v1alpha1"
				"kind":       "ClusterServiceVersion"
				"metadata": {
					"name": "packageserver"
					"labels": {
						"olm.version": "v0.24.0"
					}
				}
				"spec": {
					"displayName":    "Package Server"
					"description":    "Represents an Operator package that is available from a given CatalogSource which will resolve to a ClusterServiceVersion."
					"minKubeVersion": "1.11.0"
					"keywords": [
						"packagemanifests",
						"olm",
						"packages",
					]
					"maintainers": [
						{
							"name":  "Red Hat"
							"email": "openshift-operators@redhat.com"
						},
					]
					"provider": {
						"name": "Red Hat"
					}
					"links": [
						{
							"name": "Package Server"
							"url":  "https://github.com/operator-framework/operator-lifecycle-manager/tree/master/pkg/package-server"
						},
					]
					"installModes": [
						{
							"type":      "OwnNamespace"
							"supported": true
						},
						{
							"type":      "SingleNamespace"
							"supported": true
						},
						{
							"type":      "MultiNamespace"
							"supported": true
						},
						{
							"type":      "AllNamespaces"
							"supported": true
						},
					]
					"install": {
						"strategy": "deployment"
						"spec": {
							"clusterPermissions": [
								{
									"serviceAccountName": "olm-operator-serviceaccount"
									"rules": [
										{
											"apiGroups": [
												"authorization.k8s.io",
											]
											"resources": [
												"subjectaccessreviews",
											]
											"verbs": [
												"create",
												"get",
											]
										},
										{
											"apiGroups": [
												"",
											]
											"resources": [
												"configmaps",
											]
											"verbs": [
												"get",
												"list",
												"watch",
											]
										},
										{
											"apiGroups": [
												"operators.coreos.com",
											]
											"resources": [
												"catalogsources",
											]
											"verbs": [
												"get",
												"list",
												"watch",
											]
										},
										{
											"apiGroups": [
												"packages.operators.coreos.com",
											]
											"resources": [
												"packagemanifests",
											]
											"verbs": [
												"get",
												"list",
											]
										},
									]
								},
							]
							"deployments": [
								{
									"name": "packageserver"
									"spec": {
										"strategy": {
											"type": "RollingUpdate"
											"rollingUpdate": {
												"maxUnavailable": 1
												"maxSurge":       1
											}
										}
										"replicas": 2
										"selector": {
											"matchLabels": {
												"app": "packageserver"
											}
										}
										"template": {
											"metadata": {
												"labels": {
													"app": "packageserver"
												}
											}
											"spec": {
												"securityContext": {
													"runAsNonRoot": true
													"seccompProfile": {
														"type": "RuntimeDefault"
													}
												}
												"serviceAccountName": "olm-operator-serviceaccount"
												"nodeSelector": {
													"kubernetes.io/os": "linux"
												}
												"containers": [
													{
														"name": "packageserver"
														"securityContext": {
															"allowPrivilegeEscalation": false
															"capabilities": {
																"drop": [
																	"ALL",
																]
															}
														}
														"command": [
															"/bin/package-server",
															"-v=4",
															"--secure-port",
															"5443",
															"--global-namespace",
															"olm",
														]
														"image":           "quay.io/operator-framework/olm@sha256:f9ea8cef95ac9b31021401d4863711a5eec904536b449724e0f00357548a31e7"
														"imagePullPolicy": "Always"
														"ports": [
															{
																"containerPort": 5443
															},
														]
														"livenessProbe": {
															"httpGet": {
																"scheme": "HTTPS"
																"path":   "/healthz"
																"port":   5443
															}
														}
														"readinessProbe": {
															"httpGet": {
																"scheme": "HTTPS"
																"path":   "/healthz"
																"port":   5443
															}
														}
														"terminationMessagePolicy": "FallbackToLogsOnError"
														"resources": {
															"requests": {
																"cpu":    "10m"
																"memory": "50Mi"
															}
														}
														"volumeMounts": [
															{
																"name":      "tmpfs"
																"mountPath": "/tmp"
															},
														]
													},
												]
												"volumes": [
													{
														"name": "tmpfs"
														"emptyDir": {}
													},
												]
											}
										}
									}
								},
							]
						}
					}
					"maturity": "alpha"
					"version":  "v0.24.0"
					"apiservicedefinitions": {
						"owned": [
							{
								"group":          "packages.operators.coreos.com"
								"version":        "v1"
								"kind":           "PackageManifest"
								"name":           "packagemanifests"
								"displayName":    "PackageManifest"
								"description":    "A PackageManifest is a resource generated from existing CatalogSources and their ConfigMaps"
								"deploymentName": "packageserver"
								"containerPort":  5443
							},
						]
					}
				}
			},
		]
	}
}
