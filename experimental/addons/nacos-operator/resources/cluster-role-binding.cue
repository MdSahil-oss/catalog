package main

nacosOperator: {
	type: "k8s-objects"
	name: "nacos-operator"
	properties: {
		objects: [
			{
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"kind":       "ClusterRoleBinding"
				"metadata": {
					"name": "nacos-operator"
				}
				"roleRef": {
					"apiGroup": "rbac.authorization.k8s.io"
					"kind":     "ClusterRole"
					"name":     "nacos-operator"
				}
				"subjects": [
					{
						"kind":      "ServiceAccount"
						"name":      "nacos-operator"
						"namespace": parameter.namespace
					},
				]
			},
			{
				"apiVersion": "rbac.authorization.k8s.io/v1"
				"kind":       "ClusterRole"
				"metadata": {
					"name": "nacos-operator"
				}
				"rules": [
					{
						"apiGroups": [
							"nacos.io",
						]
						"resources": [
							"nacos",
						]
						"verbs": [
							"create",
							"delete",
							"get",
							"list",
							"patch",
							"update",
							"watch",
						]
					},
					{
						"apiGroups": [
							"nacos.io",
						]
						"resources": [
							"nacos/status",
						]
						"verbs": [
							"get",
							"patch",
							"update",
						]
					},
					{
						"apiGroups": [
							"",
							"apps",
							"batch",
						]
						"resources": [
							"configmaps",
							"statefulsets",
							"pods",
							"services",
							"events",
							"jobs",
						]
						"verbs": [
							"get",
							"create",
							"update",
							"patch",
							"list",
							"watch",
						]
					},
				]
			},
			{
				"apiVersion": "apiextensions.k8s.io/v1"
				"kind":       "CustomResourceDefinition"
				"metadata": {
					"annotations": {
						"controller-gen.kubebuilder.io/version": "(devel)"
					}
					"creationTimestamp": null
					"name":              "nacos.nacos.io"
				}
				"spec": {
					"group": "nacos.io"
					"names": {
						"kind":     "Nacos"
						"listKind": "NacosList"
						"plural":   "nacos"
						"singular": "nacos"
					}
					"scope": "Namespaced"
					"versions": [
						{
							"additionalPrinterColumns": [
								{
									"jsonPath": ".spec.replicas"
									"name":     "Replicas"
									"type":     "string"
								},
								{
									"jsonPath": ".status.phase"
									"name":     "Ready"
									"type":     "string"
								},
								{
									"jsonPath": ".spec.type"
									"name":     "type"
									"type":     "string"
								},
								{
									"jsonPath": ".spec.database.type"
									"name":     "dbType"
									"type":     "string"
								},
								{
									"jsonPath": ".status.version"
									"name":     "Version"
									"type":     "string"
								},
								{
									"jsonPath": ".metadata.creationTimestamp"
									"name":     "CreateTime"
									"type":     "string"
								},
							]
							"name": "v1alpha1"
							"schema": {
								"openAPIV3Schema": {
									"description": "Nacos is the Schema for the nacos API"
									"properties": {
										"apiVersion": {
											"description": "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
											"type":        "string"
										}
										"kind": {
											"description": "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
											"type":        "string"
										}
										"metadata": {
											"type": "object"
										}
										"spec": {
											"description": "NacosSpec defines the desired state of Nacos"
											"properties": {
												"affinity": {
													"description": "Affinity is a group of affinity scheduling rules."
													"properties": {
														"nodeAffinity": {
															"description": "Describes node affinity scheduling rules for the pod."
															"properties": {
																"preferredDuringSchedulingIgnoredDuringExecution": {
																	"description": "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred."
																	"items": {
																		"description": "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
																		"properties": {
																			"preference": {
																				"description": "A node selector term, associated with the corresponding weight."
																				"properties": {
																					"matchExpressions": {
																						"description": "A list of node selector requirements by node's labels."
																						"items": {
																							"description": "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "The label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																									"type":        "string"
																								}
																								"values": {
																									"description": "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"matchFields": {
																						"description": "A list of node selector requirements by node's fields."
																						"items": {
																							"description": "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "The label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																									"type":        "string"
																								}
																								"values": {
																									"description": "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"weight": {
																				"description": "Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100."
																				"format":      "int32"
																				"type":        "integer"
																			}
																		}
																		"required": [
																			"preference",
																			"weight",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
																"requiredDuringSchedulingIgnoredDuringExecution": {
																	"description": "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to an update), the system may or may not try to eventually evict the pod from its node."
																	"properties": {
																		"nodeSelectorTerms": {
																			"description": "Required. A list of node selector terms. The terms are ORed."
																			"items": {
																				"description": "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
																				"properties": {
																					"matchExpressions": {
																						"description": "A list of node selector requirements by node's labels."
																						"items": {
																							"description": "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "The label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																									"type":        "string"
																								}
																								"values": {
																									"description": "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"matchFields": {
																						"description": "A list of node selector requirements by node's fields."
																						"items": {
																							"description": "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "The label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																									"type":        "string"
																								}
																								"values": {
																									"description": "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"type": "array"
																		}
																	}
																	"required": [
																		"nodeSelectorTerms",
																	]
																	"type": "object"
																}
															}
															"type": "object"
														}
														"podAffinity": {
															"description": "Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s))."
															"properties": {
																"preferredDuringSchedulingIgnoredDuringExecution": {
																	"description": "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred."
																	"items": {
																		"description": "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
																		"properties": {
																			"podAffinityTerm": {
																				"description": "Required. A pod affinity term, associated with the corresponding weight."
																				"properties": {
																					"labelSelector": {
																						"description": "A label query over a set of resources, in this case pods."
																						"properties": {
																							"matchExpressions": {
																								"description": "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																								"items": {
																									"description": "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																									"properties": {
																										"key": {
																											"description": "key is the label key that the selector applies to."
																											"type":        "string"
																										}
																										"operator": {
																											"description": "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																											"type":        "string"
																										}
																										"values": {
																											"description": "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
																											"items": {
																												"type": "string"
																											}
																											"type": "array"
																										}
																									}
																									"required": [
																										"key",
																										"operator",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"matchLabels": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"description": "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
																								"type":        "object"
																							}
																						}
																						"type": "object"
																					}
																					"namespaces": {
																						"description": "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"topologyKey": {
																						"description": "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
																						"type":        "string"
																					}
																				}
																				"required": [
																					"topologyKey",
																				]
																				"type": "object"
																			}
																			"weight": {
																				"description": "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
																				"format":      "int32"
																				"type":        "integer"
																			}
																		}
																		"required": [
																			"podAffinityTerm",
																			"weight",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
																"requiredDuringSchedulingIgnoredDuringExecution": {
																	"description": "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied."
																	"items": {
																		"description": "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running"
																		"properties": {
																			"labelSelector": {
																				"description": "A label query over a set of resources, in this case pods."
																				"properties": {
																					"matchExpressions": {
																						"description": "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																						"items": {
																							"description": "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "key is the label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																									"type":        "string"
																								}
																								"values": {
																									"description": "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"matchLabels": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"description": "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
																						"type":        "object"
																					}
																				}
																				"type": "object"
																			}
																			"namespaces": {
																				"description": "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"topologyKey": {
																				"description": "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
																				"type":        "string"
																			}
																		}
																		"required": [
																			"topologyKey",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
															}
															"type": "object"
														}
														"podAntiAffinity": {
															"description": "Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s))."
															"properties": {
																"preferredDuringSchedulingIgnoredDuringExecution": {
																	"description": "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred."
																	"items": {
																		"description": "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
																		"properties": {
																			"podAffinityTerm": {
																				"description": "Required. A pod affinity term, associated with the corresponding weight."
																				"properties": {
																					"labelSelector": {
																						"description": "A label query over a set of resources, in this case pods."
																						"properties": {
																							"matchExpressions": {
																								"description": "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																								"items": {
																									"description": "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																									"properties": {
																										"key": {
																											"description": "key is the label key that the selector applies to."
																											"type":        "string"
																										}
																										"operator": {
																											"description": "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																											"type":        "string"
																										}
																										"values": {
																											"description": "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
																											"items": {
																												"type": "string"
																											}
																											"type": "array"
																										}
																									}
																									"required": [
																										"key",
																										"operator",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"matchLabels": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"description": "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
																								"type":        "object"
																							}
																						}
																						"type": "object"
																					}
																					"namespaces": {
																						"description": "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"topologyKey": {
																						"description": "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
																						"type":        "string"
																					}
																				}
																				"required": [
																					"topologyKey",
																				]
																				"type": "object"
																			}
																			"weight": {
																				"description": "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
																				"format":      "int32"
																				"type":        "integer"
																			}
																		}
																		"required": [
																			"podAffinityTerm",
																			"weight",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
																"requiredDuringSchedulingIgnoredDuringExecution": {
																	"description": "If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied."
																	"items": {
																		"description": "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running"
																		"properties": {
																			"labelSelector": {
																				"description": "A label query over a set of resources, in this case pods."
																				"properties": {
																					"matchExpressions": {
																						"description": "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																						"items": {
																							"description": "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																							"properties": {
																								"key": {
																									"description": "key is the label key that the selector applies to."
																									"type":        "string"
																								}
																								"operator": {
																									"description": "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																									"type":        "string"
																								}
																								"values": {
																									"description": "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
																									"items": {
																										"type": "string"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"key",
																								"operator",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"matchLabels": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"description": "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
																						"type":        "object"
																					}
																				}
																				"type": "object"
																			}
																			"namespaces": {
																				"description": "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"topologyKey": {
																				"description": "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
																				"type":        "string"
																			}
																		}
																		"required": [
																			"topologyKey",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
															}
															"type": "object"
														}
													}
													"type": "object"
												}
												"config": {
													"description": "配置文件"
													"type":        "string"
												}
												"database": {
													"properties": {
														"mysqlDb": {
															"type": "string"
														}
														"mysqlHost": {
															"type": "string"
														}
														"mysqlPassword": {
															"type": "string"
														}
														"mysqlPort": {
															"type": "string"
														}
														"mysqlUser": {
															"type": "string"
														}
														"type": {
															"type": "string"
														}
													}
													"type": "object"
												}
												"env": {
													"items": {
														"description": "EnvVar represents an environment variable present in a Container."
														"properties": {
															"name": {
																"description": "Name of the environment variable. Must be a C_IDENTIFIER."
																"type":        "string"
															}
															"value": {
																"description": "Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to \"\"."
																"type":        "string"
															}
															"valueFrom": {
																"description": "Source for the environment variable's value. Cannot be used if value is not empty."
																"properties": {
																	"configMapKeyRef": {
																		"description": "Selects a key of a ConfigMap."
																		"properties": {
																			"key": {
																				"description": "The key to select."
																				"type":        "string"
																			}
																			"name": {
																				"description": "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																				"type":        "string"
																			}
																			"optional": {
																				"description": "Specify whether the ConfigMap or its key must be defined"
																				"type":        "boolean"
																			}
																		}
																		"required": [
																			"key",
																		]
																		"type": "object"
																	}
																	"fieldRef": {
																		"description": "Selects a field of the pod: supports metadata.name, metadata.namespace, metadata.labels, metadata.annotations, spec.nodeName, spec.serviceAccountName, status.hostIP, status.podIP, status.podIPs."
																		"properties": {
																			"apiVersion": {
																				"description": "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																				"type":        "string"
																			}
																			"fieldPath": {
																				"description": "Path of the field to select in the specified API version."
																				"type":        "string"
																			}
																		}
																		"required": [
																			"fieldPath",
																		]
																		"type": "object"
																	}
																	"resourceFieldRef": {
																		"description": "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests.ephemeral-storage) are currently supported."
																		"properties": {
																			"containerName": {
																				"description": "Container name: required for volumes, optional for env vars"
																				"type":        "string"
																			}
																			"divisor": {
																				"anyOf": [
																					{
																						"type": "integer"
																					},
																					{
																						"type": "string"
																					},
																				]
																				"description":                "Specifies the output format of the exposed resources, defaults to \"1\""
																				"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																				"x-kubernetes-int-or-string": true
																			}
																			"resource": {
																				"description": "Required: resource to select"
																				"type":        "string"
																			}
																		}
																		"required": [
																			"resource",
																		]
																		"type": "object"
																	}
																	"secretKeyRef": {
																		"description": "Selects a key of a secret in the pod's namespace"
																		"properties": {
																			"key": {
																				"description": "The key of the secret to select from.  Must be a valid secret key."
																				"type":        "string"
																			}
																			"name": {
																				"description": "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																				"type":        "string"
																			}
																			"optional": {
																				"description": "Specify whether the Secret or its key must be defined"
																				"type":        "boolean"
																			}
																		}
																		"required": [
																			"key",
																		]
																		"type": "object"
																	}
																}
																"type": "object"
															}
														}
														"required": [
															"name",
														]
														"type": "object"
													}
													"type": "array"
												}
												"image": {
													"description": "INSERT ADDITIONAL SPEC FIELDS - desired state of cluster Important: Run \"make\" to regenerate code after modifying this file 通用配置"
													"type":        "string"
												}
												"imagePullSecrets": {
													"items": {
														"description": "LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace."
														"properties": {
															"name": {
																"description": "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																"type":        "string"
															}
														}
														"type": "object"
													}
													"type": "array"
												}
												"k8sWrapper": {
													"description": "通用k8s配置包装器"
													"properties": {
														"PodSpec": {
															"type": "object"
														}
													}
													"type": "object"
												}
												"livenessProbe": {
													"description": "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
													"properties": {
														"exec": {
															"description": "One and only one of the following should be specified. Exec specifies the action to take."
															"properties": {
																"command": {
																	"description": "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy."
																	"items": {
																		"type": "string"
																	}
																	"type": "array"
																}
															}
															"type": "object"
														}
														"failureThreshold": {
															"description": "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"httpGet": {
															"description": "HTTPGet specifies the http request to perform."
															"properties": {
																"host": {
																	"description": "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	"type":        "string"
																}
																"httpHeaders": {
																	"description": "Custom headers to set in the request. HTTP allows repeated headers."
																	"items": {
																		"description": "HTTPHeader describes a custom header to be used in HTTP probes"
																		"properties": {
																			"name": {
																				"description": "The header field name"
																				"type":        "string"
																			}
																			"value": {
																				"description": "The header field value"
																				"type":        "string"
																			}
																		}
																		"required": [
																			"name",
																			"value",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
																"path": {
																	"description": "Path to access on the HTTP server."
																	"type":        "string"
																}
																"port": {
																	"anyOf": [
																		{
																			"type": "integer"
																		},
																		{
																			"type": "string"
																		},
																	]
																	"description":                "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																"scheme": {
																	"description": "Scheme to use for connecting to the host. Defaults to HTTP."
																	"type":        "string"
																}
															}
															"required": [
																"port",
															]
															"type": "object"
														}
														"initialDelaySeconds": {
															"description": "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
															"format":      "int32"
															"type":        "integer"
														}
														"periodSeconds": {
															"description": "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"successThreshold": {
															"description": "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"tcpSocket": {
															"description": "TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported TODO: implement a realistic TCP lifecycle hook"
															"properties": {
																"host": {
																	"description": "Optional: Host name to connect to, defaults to the pod IP."
																	"type":        "string"
																}
																"port": {
																	"anyOf": [
																		{
																			"type": "integer"
																		},
																		{
																			"type": "string"
																		},
																	]
																	"description":                "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															"required": [
																"port",
															]
															"type": "object"
														}
														"timeoutSeconds": {
															"description": "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
															"format":      "int32"
															"type":        "integer"
														}
													}
													"type": "object"
												}
												"mysqlInitImage": {
													"type": "string"
												}
												"nodeSelector": {
													"additionalProperties": {
														"type": "string"
													}
													"type": "object"
												}
												"readinessProbe": {
													"description": "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
													"properties": {
														"exec": {
															"description": "One and only one of the following should be specified. Exec specifies the action to take."
															"properties": {
																"command": {
																	"description": "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy."
																	"items": {
																		"type": "string"
																	}
																	"type": "array"
																}
															}
															"type": "object"
														}
														"failureThreshold": {
															"description": "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"httpGet": {
															"description": "HTTPGet specifies the http request to perform."
															"properties": {
																"host": {
																	"description": "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	"type":        "string"
																}
																"httpHeaders": {
																	"description": "Custom headers to set in the request. HTTP allows repeated headers."
																	"items": {
																		"description": "HTTPHeader describes a custom header to be used in HTTP probes"
																		"properties": {
																			"name": {
																				"description": "The header field name"
																				"type":        "string"
																			}
																			"value": {
																				"description": "The header field value"
																				"type":        "string"
																			}
																		}
																		"required": [
																			"name",
																			"value",
																		]
																		"type": "object"
																	}
																	"type": "array"
																}
																"path": {
																	"description": "Path to access on the HTTP server."
																	"type":        "string"
																}
																"port": {
																	"anyOf": [
																		{
																			"type": "integer"
																		},
																		{
																			"type": "string"
																		},
																	]
																	"description":                "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																"scheme": {
																	"description": "Scheme to use for connecting to the host. Defaults to HTTP."
																	"type":        "string"
																}
															}
															"required": [
																"port",
															]
															"type": "object"
														}
														"initialDelaySeconds": {
															"description": "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
															"format":      "int32"
															"type":        "integer"
														}
														"periodSeconds": {
															"description": "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"successThreshold": {
															"description": "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
															"format":      "int32"
															"type":        "integer"
														}
														"tcpSocket": {
															"description": "TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported TODO: implement a realistic TCP lifecycle hook"
															"properties": {
																"host": {
																	"description": "Optional: Host name to connect to, defaults to the pod IP."
																	"type":        "string"
																}
																"port": {
																	"anyOf": [
																		{
																			"type": "integer"
																		},
																		{
																			"type": "string"
																		},
																	]
																	"description":                "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															"required": [
																"port",
															]
															"type": "object"
														}
														"timeoutSeconds": {
															"description": "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
															"format":      "int32"
															"type":        "integer"
														}
													}
													"type": "object"
												}
												"replicas": {
													"format": "int32"
													"type":   "integer"
												}
												"resources": {
													"description": "VolumeClaimTemplates []v1.PersistentVolumeClaim `json:\"volumeClaimTemplates,omitempty\" protobuf:\"bytes,4,rep,name=volumeClaimTemplates\"`"
													"properties": {
														"limits": {
															"additionalProperties": {
																"anyOf": [
																	{
																		"type": "integer"
																	},
																	{
																		"type": "string"
																	},
																]
																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																"x-kubernetes-int-or-string": true
															}
															"description": "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/"
															"type":        "object"
														}
														"requests": {
															"additionalProperties": {
																"anyOf": [
																	{
																		"type": "integer"
																	},
																	{
																		"type": "string"
																	},
																]
																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																"x-kubernetes-int-or-string": true
															}
															"description": "Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/"
															"type":        "object"
														}
													}
													"type": "object"
												}
												"tolerations": {
													"items": {
														"description": "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
														"properties": {
															"effect": {
																"description": "Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute."
																"type":        "string"
															}
															"key": {
																"description": "Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys."
																"type":        "string"
															}
															"operator": {
																"description": "Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category."
																"type":        "string"
															}
															"tolerationSeconds": {
																"description": "TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system."
																"format":      "int64"
																"type":        "integer"
															}
															"value": {
																"description": "Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string."
																"type":        "string"
															}
														}
														"type": "object"
													}
													"type": "array"
												}
												"type": {
													"description": "自定义配置 部署模式"
													"type":        "string"
												}
												"volume": {
													"properties": {
														"enabled": {
															"type": "boolean"
														}
														"requests": {
															"additionalProperties": {
																"anyOf": [
																	{
																		"type": "integer"
																	},
																	{
																		"type": "string"
																	},
																]
																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																"x-kubernetes-int-or-string": true
															}
															"description": "ResourceList is a set of (resource name, quantity) pairs."
															"type":        "object"
														}
														"storageClass": {
															"type": "string"
														}
													}
													"type": "object"
												}
											}
											"type": "object"
										}
										"status": {
											"description": "NacosStatus defines the observed state of Nacos"
											"properties": {
												"conditions": {
													"description": "INSERT ADDITIONAL STATUS FIELD - define observed state of cluster Important: Run \"make\" to regenerate code after modifying this file 记录实例状态"
													"items": {
														"description": "状况"
														"properties": {
															"hostIP": {
																"type": "string"
															}
															"instance": {
																"type": "string"
															}
															"message": {
																"description": "Human-readable message indicating details about last transition."
																"type":        "string"
															}
															"nodeName": {
																"type": "string"
															}
															"podName": {
																"type": "string"
															}
															"reason": {
																"description": "Last time we probed the condition. LastProbeTime metav1.Time `json:\"lastProbeTime,omitempty\" protobuf:\"bytes,3,opt,name=lastProbeTime\"` Last time the condition transitioned from one status to another. LastTransitionTime metav1.Time `json:\"lastTransitionTime,omitempty\" protobuf:\"bytes,4,opt,name=lastTransitionTime\"` Unique, one-word, CamelCase reason for the condition's last transition."
																"type":        "string"
															}
															"status": {
																"description": "Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions"
																"type":        "string"
															}
															"type": {
																"description": "Type is the type of the condition. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions"
																"type":        "string"
															}
														}
														"required": [
															"status",
															"type",
														]
														"type": "object"
													}
													"type": "array"
												}
												"event": {
													"description": "记录事件"
													"items": {
														"description": "事件"
														"properties": {
															"code": {
																"description": "错误码"
																"type":        "integer"
															}
															"firstAppearTime": {
																"description": "最早出现时间"
																"format":      "date-time"
																"type":        "string"
															}
															"lastTransitionTime": {
																"description": "更新事件"
																"format":      "date-time"
																"type":        "string"
															}
															"message": {
																"description": "时间描述"
																"type":        "string"
															}
															"status": {
																"type": "boolean"
															}
														}
														"required": [
															"status",
														]
														"type": "object"
													}
													"type": "array"
												}
												"phase": {
													"description": "运行状态，主要根据这个字段用来判断是否正常"
													"type":        "string"
												}
												"version": {
													"type": "string"
												}
											}
											"type": "object"
										}
									}
									"type": "object"
								}
							}
							"served":  true
							"storage": true
							"subresources": {
								"status": {}
							}
						},
					]
				}
			},
			{
				"apiVersion": "apps/v1"
				"kind":       "Deployment"
				"metadata": {
					"name":      "nacos-operator"
					"namespace": parameter.namespace
					"labels": {
						"helm.sh/chart":                "nacos-operator-0.1.0"
						"app.kubernetes.io/name":       "nacos-operator"
						"app.kubernetes.io/instance":   "nacos-operator"
						"app.kubernetes.io/version":    "1.16.0"
						"app.kubernetes.io/managed-by": "Helm"
					}
				}
				"spec": {
					"replicas": 1
					"selector": {
						"matchLabels": {
							"app.kubernetes.io/name":     "nacos-operator"
							"app.kubernetes.io/instance": "nacos-operator"
						}
					}
					"template": {
						"metadata": {
							"labels": {
								"app.kubernetes.io/name":     "nacos-operator"
								"app.kubernetes.io/instance": "nacos-operator"
							}
						}
						"spec": {
							"serviceAccountName": "nacos-operator"
							"securityContext": {}
							"containers": [
								{
									"name": "nacos-operator"
									"securityContext": {}
									"image": "nacos/nacos-operator:latest"
									"command": [
										"/manager",
									]
									"args": [
										"--enable-leader-election",
									]
									"imagePullPolicy": "Always"
									"resources": {
										"limits": {
											"cpu":    "100m"
											"memory": "128Mi"
										}
										"requests": {
											"cpu":    "100m"
											"memory": "128Mi"
										}
									}
								},
							]
						}
					}
				}
			},
			{
				"apiVersion": "v1"
				"kind":       "ServiceAccount"
				"metadata": {
					"name":      "nacos-operator"
					"namespace": parameter.namespace
					"labels": {
						"helm.sh/chart":                "nacos-operator-0.1.0"
						"app.kubernetes.io/name":       "nacos-operator"
						"app.kubernetes.io/instance":   "nacos-operator"
						"app.kubernetes.io/version":    "1.16.0"
						"app.kubernetes.io/managed-by": "Helm"
					}
				}
			},
			{
				"apiVersion": "v1"
				"kind":       "Service"
				"metadata": {
					"name":      "nacos-operator"
					"namespace": parameter.namespace
					"labels": {
						"helm.sh/chart":                "nacos-operator-0.1.0"
						"app.kubernetes.io/name":       "nacos-operator"
						"app.kubernetes.io/instance":   "nacos-operator"
						"app.kubernetes.io/version":    "1.16.0"
						"app.kubernetes.io/managed-by": "Helm"
					}
				}
				"spec": {
					"type": "ClusterIP"
					"ports": [
						{
							"port":       8080
							"targetPort": "http"
							"protocol":   "TCP"
							"name":       "http"
						},
					]
					"selector": {
						"app.kubernetes.io/name":     "nacos-operator"
						"app.kubernetes.io/instance": "nacos-operator"
					}
				}
			},
		]
	}
}
