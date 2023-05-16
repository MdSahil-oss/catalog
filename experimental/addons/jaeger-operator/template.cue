package main

output: {
	apiVersion: "core.oam.dev/v1beta1"
	kind:       "Application"
	spec: {
		components: [
			{
				name: "ns-jaeger-operator"
				type: "k8s-objects"
				properties: objects: [{
					kind:       "Namespace"
					apiVersion: "v1"
					metadata:
						name: parameter.namespace
				}]
			},
			{
				name: "jaeger-operator"
				type: "k8s-objects"
				properties: objects: [
					{
						"apiVersion": "apiextensions.k8s.io/v1"
						"kind":       "CustomResourceDefinition"
						"metadata": {
							"annotations": {
								"cert-manager.io/inject-ca-from":        "jaeger-operator/jaeger-operator-serving-cert"
								"controller-gen.kubebuilder.io/version": "v0.9.2"
							}
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "jaegers.jaegertracing.io"
						}
						"spec": {
							"group": "jaegertracing.io"
							"names": {
								"kind":     "Jaeger"
								"listKind": "JaegerList"
								"plural":   "jaegers"
								"singular": "jaeger"
							}
							"scope": "Namespaced"
							"versions": [
								{
									"additionalPrinterColumns": [
										{
											"description": "Jaeger instance's status"
											"jsonPath":    ".status.phase"
											"name":        "Status"
											"type":        "string"
										},
										{
											"description": "Jaeger Version"
											"jsonPath":    ".status.version"
											"name":        "Version"
											"type":        "string"
										},
										{
											"description": "Jaeger deployment strategy"
											"jsonPath":    ".spec.strategy"
											"name":        "Strategy"
											"type":        "string"
										},
										{
											"description": "Jaeger storage type"
											"jsonPath":    ".spec.storage.type"
											"name":        "Storage"
											"type":        "string"
										},
										{
											"jsonPath": ".metadata.creationTimestamp"
											"name":     "Age"
											"type":     "date"
										},
									]
									"name": "v1"
									"schema": {
										"openAPIV3Schema": {
											"properties": {
												"apiVersion": {
													"type": "string"
												}
												"kind": {
													"type": "string"
												}
												"metadata": {
													"type": "object"
												}
												"spec": {
													"properties": {
														"affinity": {
															"properties": {
																"nodeAffinity": {
																	"properties": {
																		"preferredDuringSchedulingIgnoredDuringExecution": {
																			"items": {
																				"properties": {
																					"preference": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"weight": {
																						"format": "int32"
																						"type":   "integer"
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
																			"properties": {
																				"nodeSelectorTerms": {
																					"items": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"type": "array"
																				}
																			}
																			"required": [
																				"nodeSelectorTerms",
																			]
																			"type":                  "object"
																			"x-kubernetes-map-type": "atomic"
																		}
																	}
																	"type": "object"
																}
																"podAffinity": {
																	"properties": {
																		"preferredDuringSchedulingIgnoredDuringExecution": {
																			"items": {
																				"properties": {
																					"podAffinityTerm": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"topologyKey",
																						]
																						"type": "object"
																					}
																					"weight": {
																						"format": "int32"
																						"type":   "integer"
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
																			"items": {
																				"properties": {
																					"labelSelector": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"type": "object"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"namespaceSelector": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"type": "object"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"namespaces": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"topologyKey": {
																						"type": "string"
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
																	"properties": {
																		"preferredDuringSchedulingIgnoredDuringExecution": {
																			"items": {
																				"properties": {
																					"podAffinityTerm": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"topologyKey",
																						]
																						"type": "object"
																					}
																					"weight": {
																						"format": "int32"
																						"type":   "integer"
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
																			"items": {
																				"properties": {
																					"labelSelector": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"type": "object"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"namespaceSelector": {
																						"properties": {
																							"matchExpressions": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"operator": {
																											"type": "string"
																										}
																										"values": {
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
																								"type": "object"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"namespaces": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"topologyKey": {
																						"type": "string"
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
														"agent": {
															"nullable": true
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"config": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"dnsPolicy": {
																	"type": "string"
																}
																"hostNetwork": {
																	"type": "boolean"
																}
																"image": {
																	"type": "string"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"priorityClassName": {
																	"type": "string"
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"sidecarSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"strategy": {
																	"type": "string"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"allInOne": {
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"config": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"image": {
																	"type": "string"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"metricsStorage": {
																	"properties": {
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"strategy": {
																	"properties": {
																		"rollingUpdate": {
																			"properties": {
																				"maxSurge": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																				"maxUnavailable": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"type": "object"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"tracingEnabled": {
																	"type": "boolean"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"annotations": {
															"additionalProperties": {
																"type": "string"
															}
															"nullable": true
															"type":     "object"
														}
														"collector": {
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"autoscale": {
																	"type": "boolean"
																}
																"config": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"image": {
																	"type": "string"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"kafkaSecretName": {
																	"type": "string"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"maxReplicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"minReplicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"nodeSelector": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"priorityClassName": {
																	"type": "string"
																}
																"replicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"serviceType": {
																	"type": "string"
																}
																"strategy": {
																	"properties": {
																		"rollingUpdate": {
																			"properties": {
																				"maxSurge": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																				"maxUnavailable": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"type": "object"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"containerSecurityContext": {
															"properties": {
																"allowPrivilegeEscalation": {
																	"type": "boolean"
																}
																"capabilities": {
																	"properties": {
																		"add": {
																			"items": {
																				"type": "string"
																			}
																			"type": "array"
																		}
																		"drop": {
																			"items": {
																				"type": "string"
																			}
																			"type": "array"
																		}
																	}
																	"type": "object"
																}
																"privileged": {
																	"type": "boolean"
																}
																"procMount": {
																	"type": "string"
																}
																"readOnlyRootFilesystem": {
																	"type": "boolean"
																}
																"runAsGroup": {
																	"format": "int64"
																	"type":   "integer"
																}
																"runAsNonRoot": {
																	"type": "boolean"
																}
																"runAsUser": {
																	"format": "int64"
																	"type":   "integer"
																}
																"seLinuxOptions": {
																	"properties": {
																		"level": {
																			"type": "string"
																		}
																		"role": {
																			"type": "string"
																		}
																		"type": {
																			"type": "string"
																		}
																		"user": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"seccompProfile": {
																	"properties": {
																		"localhostProfile": {
																			"type": "string"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"type",
																	]
																	"type": "object"
																}
																"windowsOptions": {
																	"properties": {
																		"gmsaCredentialSpec": {
																			"type": "string"
																		}
																		"gmsaCredentialSpecName": {
																			"type": "string"
																		}
																		"hostProcess": {
																			"type": "boolean"
																		}
																		"runAsUserName": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
															}
															"type": "object"
														}
														"imagePullPolicy": {
															"type": "string"
														}
														"imagePullSecrets": {
															"items": {
																"properties": {
																	"name": {
																		"type": "string"
																	}
																}
																"type":                  "object"
																"x-kubernetes-map-type": "atomic"
															}
															"type":                   "array"
															"x-kubernetes-list-type": "atomic"
														}
														"ingester": {
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"autoscale": {
																	"type": "boolean"
																}
																"config": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"image": {
																	"type": "string"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"kafkaSecretName": {
																	"type": "string"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"maxReplicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"minReplicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"nodeSelector": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"replicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"strategy": {
																	"properties": {
																		"rollingUpdate": {
																			"properties": {
																				"maxSurge": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																				"maxUnavailable": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"type": "object"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"ingress": {
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"enabled": {
																	"type": "boolean"
																}
																"hosts": {
																	"items": {
																		"type": "string"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"ingressClassName": {
																	"type": "string"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"openshift": {
																	"properties": {
																		"delegateUrls": {
																			"type": "string"
																		}
																		"htpasswdFile": {
																			"type": "string"
																		}
																		"sar": {
																			"type": "string"
																		}
																		"skipLogout": {
																			"type": "boolean"
																		}
																	}
																	"type": "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"pathType": {
																	"type": "string"
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"secretName": {
																	"type": "string"
																}
																"security": {
																	"type": "string"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"tls": {
																	"items": {
																		"properties": {
																			"hosts": {
																				"items": {
																					"type": "string"
																				}
																				"type":                   "array"
																				"x-kubernetes-list-type": "atomic"
																			}
																			"secretName": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"labels": {
															"additionalProperties": {
																"type": "string"
															}
															"type": "object"
														}
														"livenessProbe": {
															"properties": {
																"exec": {
																	"properties": {
																		"command": {
																			"items": {
																				"type": "string"
																			}
																			"type": "array"
																		}
																	}
																	"type": "object"
																}
																"failureThreshold": {
																	"format": "int32"
																	"type":   "integer"
																}
																"grpc": {
																	"properties": {
																		"port": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"service": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"port",
																	]
																	"type": "object"
																}
																"httpGet": {
																	"properties": {
																		"host": {
																			"type": "string"
																		}
																		"httpHeaders": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																			"type": "string"
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
																			"x-kubernetes-int-or-string": true
																		}
																		"scheme": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"port",
																	]
																	"type": "object"
																}
																"initialDelaySeconds": {
																	"format": "int32"
																	"type":   "integer"
																}
																"periodSeconds": {
																	"format": "int32"
																	"type":   "integer"
																}
																"successThreshold": {
																	"format": "int32"
																	"type":   "integer"
																}
																"tcpSocket": {
																	"properties": {
																		"host": {
																			"type": "string"
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
																			"x-kubernetes-int-or-string": true
																		}
																	}
																	"required": [
																		"port",
																	]
																	"type": "object"
																}
																"terminationGracePeriodSeconds": {
																	"format": "int64"
																	"type":   "integer"
																}
																"timeoutSeconds": {
																	"format": "int32"
																	"type":   "integer"
																}
															}
															"type": "object"
														}
														"query": {
															"properties": {
																"affinity": {
																	"properties": {
																		"nodeAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"preference": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"properties": {
																						"nodeSelectorTerms": {
																							"items": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"type": "array"
																						}
																					}
																					"required": [
																						"nodeSelectorTerms",
																					]
																					"type":                  "object"
																					"x-kubernetes-map-type": "atomic"
																				}
																			}
																			"type": "object"
																		}
																		"podAffinity": {
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																			"properties": {
																				"preferredDuringSchedulingIgnoredDuringExecution": {
																					"items": {
																						"properties": {
																							"podAffinityTerm": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"topologyKey",
																								]
																								"type": "object"
																							}
																							"weight": {
																								"format": "int32"
																								"type":   "integer"
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
																					"items": {
																						"properties": {
																							"labelSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaceSelector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"namespaces": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"topologyKey": {
																								"type": "string"
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
																"annotations": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"containerSecurityContext": {
																	"properties": {
																		"allowPrivilegeEscalation": {
																			"type": "boolean"
																		}
																		"capabilities": {
																			"properties": {
																				"add": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																				"drop": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"privileged": {
																			"type": "boolean"
																		}
																		"procMount": {
																			"type": "string"
																		}
																		"readOnlyRootFilesystem": {
																			"type": "boolean"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"grpcNodePort": {
																	"format": "int32"
																	"type":   "integer"
																}
																"image": {
																	"type": "string"
																}
																"imagePullPolicy": {
																	"type": "string"
																}
																"imagePullSecrets": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"labels": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"type": "object"
																}
																"livenessProbe": {
																	"properties": {
																		"exec": {
																			"properties": {
																				"command": {
																					"items": {
																						"type": "string"
																					}
																					"type": "array"
																				}
																			}
																			"type": "object"
																		}
																		"failureThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"grpc": {
																			"properties": {
																				"port": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"service": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"httpGet": {
																			"properties": {
																				"host": {
																					"type": "string"
																				}
																				"httpHeaders": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																				"scheme": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"initialDelaySeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"periodSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"successThreshold": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tcpSocket": {
																			"properties": {
																				"host": {
																					"type": "string"
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
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"required": [
																				"port",
																			]
																			"type": "object"
																		}
																		"terminationGracePeriodSeconds": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"timeoutSeconds": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"metricsStorage": {
																	"properties": {
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"nodePort": {
																	"format": "int32"
																	"type":   "integer"
																}
																"nodeSelector": {
																	"additionalProperties": {
																		"type": "string"
																	}
																	"nullable": true
																	"type":     "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"priorityClassName": {
																	"type": "string"
																}
																"replicas": {
																	"format": "int32"
																	"type":   "integer"
																}
																"resources": {
																	"nullable": true
																	"properties": {
																		"claims": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type": "array"
																			"x-kubernetes-list-map-keys": [
																				"name",
																			]
																			"x-kubernetes-list-type": "map"
																		}
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
																			"type": "object"
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
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"securityContext": {
																	"properties": {
																		"fsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"fsGroupChangePolicy": {
																			"type": "string"
																		}
																		"runAsGroup": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"runAsNonRoot": {
																			"type": "boolean"
																		}
																		"runAsUser": {
																			"format": "int64"
																			"type":   "integer"
																		}
																		"seLinuxOptions": {
																			"properties": {
																				"level": {
																					"type": "string"
																				}
																				"role": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																				"user": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"seccompProfile": {
																			"properties": {
																				"localhostProfile": {
																					"type": "string"
																				}
																				"type": {
																					"type": "string"
																				}
																			}
																			"required": [
																				"type",
																			]
																			"type": "object"
																		}
																		"supplementalGroups": {
																			"items": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"type": "array"
																		}
																		"sysctls": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"value": {
																						"type": "string"
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
																		"windowsOptions": {
																			"properties": {
																				"gmsaCredentialSpec": {
																					"type": "string"
																				}
																				"gmsaCredentialSpecName": {
																					"type": "string"
																				}
																				"hostProcess": {
																					"type": "boolean"
																				}
																				"runAsUserName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																	}
																	"type": "object"
																}
																"serviceAccount": {
																	"type": "string"
																}
																"serviceType": {
																	"type": "string"
																}
																"strategy": {
																	"properties": {
																		"rollingUpdate": {
																			"properties": {
																				"maxSurge": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																				"maxUnavailable": {
																					"anyOf": [
																						{
																							"type": "integer"
																						},
																						{
																							"type": "string"
																						},
																					]
																					"x-kubernetes-int-or-string": true
																				}
																			}
																			"type": "object"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"tolerations": {
																	"items": {
																		"properties": {
																			"effect": {
																				"type": "string"
																			}
																			"key": {
																				"type": "string"
																			}
																			"operator": {
																				"type": "string"
																			}
																			"tolerationSeconds": {
																				"format": "int64"
																				"type":   "integer"
																			}
																			"value": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"tracingEnabled": {
																	"type": "boolean"
																}
																"volumeMounts": {
																	"items": {
																		"properties": {
																			"mountPath": {
																				"type": "string"
																			}
																			"mountPropagation": {
																				"type": "string"
																			}
																			"name": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"subPath": {
																				"type": "string"
																			}
																			"subPathExpr": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"mountPath",
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
																"volumes": {
																	"items": {
																		"properties": {
																			"awsElasticBlockStore": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"azureDisk": {
																				"properties": {
																					"cachingMode": {
																						"type": "string"
																					}
																					"diskName": {
																						"type": "string"
																					}
																					"diskURI": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"kind": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"diskName",
																					"diskURI",
																				]
																				"type": "object"
																			}
																			"azureFile": {
																				"properties": {
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																					"shareName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"secretName",
																					"shareName",
																				]
																				"type": "object"
																			}
																			"cephfs": {
																				"properties": {
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretFile": {
																						"type": "string"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"monitors",
																				]
																				"type": "object"
																			}
																			"cinder": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"configMap": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"name": {
																						"type": "string"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"csi": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"nodePublishSecretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeAttributes": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"downwardAPI": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"fieldRef": {
																									"properties": {
																										"apiVersion": {
																											"type": "string"
																										}
																										"fieldPath": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"fieldPath",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																								"resourceFieldRef": {
																									"properties": {
																										"containerName": {
																											"type": "string"
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
																											"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																											"x-kubernetes-int-or-string": true
																										}
																										"resource": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"resource",
																									]
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"emptyDir": {
																				"properties": {
																					"medium": {
																						"type": "string"
																					}
																					"sizeLimit": {
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
																				}
																				"type": "object"
																			}
																			"ephemeral": {
																				"properties": {
																					"volumeClaimTemplate": {
																						"properties": {
																							"metadata": {
																								"properties": {
																									"annotations": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"finalizers": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"labels": {
																										"additionalProperties": {
																											"type": "string"
																										}
																										"type": "object"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																							"spec": {
																								"properties": {
																									"accessModes": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"dataSource": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"dataSourceRef": {
																										"properties": {
																											"apiGroup": {
																												"type": "string"
																											}
																											"kind": {
																												"type": "string"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"kind",
																											"name",
																										]
																										"type": "object"
																									}
																									"resources": {
																										"properties": {
																											"claims": {
																												"items": {
																													"properties": {
																														"name": {
																															"type": "string"
																														}
																													}
																													"required": [
																														"name",
																													]
																													"type": "object"
																												}
																												"type": "array"
																												"x-kubernetes-list-map-keys": [
																													"name",
																												]
																												"x-kubernetes-list-type": "map"
																											}
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
																												"type": "object"
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
																												"type": "object"
																											}
																										}
																										"type": "object"
																									}
																									"selector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"storageClassName": {
																										"type": "string"
																									}
																									"volumeMode": {
																										"type": "string"
																									}
																									"volumeName": {
																										"type": "string"
																									}
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"spec",
																						]
																						"type": "object"
																					}
																				}
																				"type": "object"
																			}
																			"fc": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"targetWWNs": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"wwids": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"flexVolume": {
																				"properties": {
																					"driver": {
																						"type": "string"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"options": {
																						"additionalProperties": {
																							"type": "string"
																						}
																						"type": "object"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																				}
																				"required": [
																					"driver",
																				]
																				"type": "object"
																			}
																			"flocker": {
																				"properties": {
																					"datasetName": {
																						"type": "string"
																					}
																					"datasetUUID": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"gcePersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"partition": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"pdName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"pdName",
																				]
																				"type": "object"
																			}
																			"gitRepo": {
																				"properties": {
																					"directory": {
																						"type": "string"
																					}
																					"repository": {
																						"type": "string"
																					}
																					"revision": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"repository",
																				]
																				"type": "object"
																			}
																			"glusterfs": {
																				"properties": {
																					"endpoints": {
																						"type": "string"
																					}
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"endpoints",
																					"path",
																				]
																				"type": "object"
																			}
																			"hostPath": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"type": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																				]
																				"type": "object"
																			}
																			"iscsi": {
																				"properties": {
																					"chapAuthDiscovery": {
																						"type": "boolean"
																					}
																					"chapAuthSession": {
																						"type": "boolean"
																					}
																					"fsType": {
																						"type": "string"
																					}
																					"initiatorName": {
																						"type": "string"
																					}
																					"iqn": {
																						"type": "string"
																					}
																					"iscsiInterface": {
																						"type": "string"
																					}
																					"lun": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"portals": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"targetPortal": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"iqn",
																					"lun",
																					"targetPortal",
																				]
																				"type": "object"
																			}
																			"name": {
																				"type": "string"
																			}
																			"nfs": {
																				"properties": {
																					"path": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"server": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"path",
																					"server",
																				]
																				"type": "object"
																			}
																			"persistentVolumeClaim": {
																				"properties": {
																					"claimName": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																				}
																				"required": [
																					"claimName",
																				]
																				"type": "object"
																			}
																			"photonPersistentDisk": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"pdID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"pdID",
																				]
																				"type": "object"
																			}
																			"portworxVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"volumeID": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumeID",
																				]
																				"type": "object"
																			}
																			"projected": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"sources": {
																						"items": {
																							"properties": {
																								"configMap": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"downwardAPI": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"fieldRef": {
																														"properties": {
																															"apiVersion": {
																																"type": "string"
																															}
																															"fieldPath": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"fieldPath",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																													"resourceFieldRef": {
																														"properties": {
																															"containerName": {
																																"type": "string"
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
																																"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																"x-kubernetes-int-or-string": true
																															}
																															"resource": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"resource",
																														]
																														"type":                  "object"
																														"x-kubernetes-map-type": "atomic"
																													}
																												}
																												"required": [
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																									}
																									"type": "object"
																								}
																								"secret": {
																									"properties": {
																										"items": {
																											"items": {
																												"properties": {
																													"key": {
																														"type": "string"
																													}
																													"mode": {
																														"format": "int32"
																														"type":   "integer"
																													}
																													"path": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"key",
																													"path",
																												]
																												"type": "object"
																											}
																											"type": "array"
																										}
																										"name": {
																											"type": "string"
																										}
																										"optional": {
																											"type": "boolean"
																										}
																									}
																									"type":                  "object"
																									"x-kubernetes-map-type": "atomic"
																								}
																								"serviceAccountToken": {
																									"properties": {
																										"audience": {
																											"type": "string"
																										}
																										"expirationSeconds": {
																											"format": "int64"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																							}
																							"type": "object"
																						}
																						"type": "array"
																					}
																				}
																				"type": "object"
																			}
																			"quobyte": {
																				"properties": {
																					"group": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"registry": {
																						"type": "string"
																					}
																					"tenant": {
																						"type": "string"
																					}
																					"user": {
																						"type": "string"
																					}
																					"volume": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"registry",
																					"volume",
																				]
																				"type": "object"
																			}
																			"rbd": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"image": {
																						"type": "string"
																					}
																					"keyring": {
																						"type": "string"
																					}
																					"monitors": {
																						"items": {
																							"type": "string"
																						}
																						"type": "array"
																					}
																					"pool": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"user": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"image",
																					"monitors",
																				]
																				"type": "object"
																			}
																			"scaleIO": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"gateway": {
																						"type": "string"
																					}
																					"protectionDomain": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"sslEnabled": {
																						"type": "boolean"
																					}
																					"storageMode": {
																						"type": "string"
																					}
																					"storagePool": {
																						"type": "string"
																					}
																					"system": {
																						"type": "string"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"gateway",
																					"secretRef",
																					"system",
																				]
																				"type": "object"
																			}
																			"secret": {
																				"properties": {
																					"defaultMode": {
																						"format": "int32"
																						"type":   "integer"
																					}
																					"items": {
																						"items": {
																							"properties": {
																								"key": {
																									"type": "string"
																								}
																								"mode": {
																									"format": "int32"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"key",
																								"path",
																							]
																							"type": "object"
																						}
																						"type": "array"
																					}
																					"optional": {
																						"type": "boolean"
																					}
																					"secretName": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"storageos": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"secretRef": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"volumeName": {
																						"type": "string"
																					}
																					"volumeNamespace": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"vsphereVolume": {
																				"properties": {
																					"fsType": {
																						"type": "string"
																					}
																					"storagePolicyID": {
																						"type": "string"
																					}
																					"storagePolicyName": {
																						"type": "string"
																					}
																					"volumePath": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"volumePath",
																				]
																				"type": "object"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type":                   "array"
																	"x-kubernetes-list-type": "atomic"
																}
															}
															"type": "object"
														}
														"resources": {
															"nullable": true
															"properties": {
																"claims": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"name",
																		]
																		"type": "object"
																	}
																	"type": "array"
																	"x-kubernetes-list-map-keys": [
																		"name",
																	]
																	"x-kubernetes-list-type": "map"
																}
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
																	"type": "object"
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
																	"type": "object"
																}
															}
															"type": "object"
														}
														"sampling": {
															"properties": {
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
															}
															"type": "object"
														}
														"securityContext": {
															"properties": {
																"fsGroup": {
																	"format": "int64"
																	"type":   "integer"
																}
																"fsGroupChangePolicy": {
																	"type": "string"
																}
																"runAsGroup": {
																	"format": "int64"
																	"type":   "integer"
																}
																"runAsNonRoot": {
																	"type": "boolean"
																}
																"runAsUser": {
																	"format": "int64"
																	"type":   "integer"
																}
																"seLinuxOptions": {
																	"properties": {
																		"level": {
																			"type": "string"
																		}
																		"role": {
																			"type": "string"
																		}
																		"type": {
																			"type": "string"
																		}
																		"user": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"seccompProfile": {
																	"properties": {
																		"localhostProfile": {
																			"type": "string"
																		}
																		"type": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"type",
																	]
																	"type": "object"
																}
																"supplementalGroups": {
																	"items": {
																		"format": "int64"
																		"type":   "integer"
																	}
																	"type": "array"
																}
																"sysctls": {
																	"items": {
																		"properties": {
																			"name": {
																				"type": "string"
																			}
																			"value": {
																				"type": "string"
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
																"windowsOptions": {
																	"properties": {
																		"gmsaCredentialSpec": {
																			"type": "string"
																		}
																		"gmsaCredentialSpecName": {
																			"type": "string"
																		}
																		"hostProcess": {
																			"type": "boolean"
																		}
																		"runAsUserName": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
															}
															"type": "object"
														}
														"serviceAccount": {
															"type": "string"
														}
														"storage": {
															"properties": {
																"cassandraCreateSchema": {
																	"properties": {
																		"affinity": {
																			"properties": {
																				"nodeAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"preference": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"properties": {
																								"nodeSelectorTerms": {
																									"items": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"nodeSelectorTerms",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																					}
																					"type": "object"
																				}
																				"podAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																		"datacenter": {
																			"type": "string"
																		}
																		"enabled": {
																			"type": "boolean"
																		}
																		"image": {
																			"type": "string"
																		}
																		"mode": {
																			"type": "string"
																		}
																		"timeout": {
																			"type": "string"
																		}
																		"traceTTL": {
																			"type": "string"
																		}
																		"ttlSecondsAfterFinished": {
																			"format": "int32"
																			"type":   "integer"
																		}
																	}
																	"type": "object"
																}
																"dependencies": {
																	"properties": {
																		"affinity": {
																			"properties": {
																				"nodeAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"preference": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"properties": {
																								"nodeSelectorTerms": {
																									"items": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"nodeSelectorTerms",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																					}
																					"type": "object"
																				}
																				"podAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																		"annotations": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"nullable": true
																			"type":     "object"
																		}
																		"backoffLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"cassandraClientAuthEnabled": {
																			"type": "boolean"
																		}
																		"containerSecurityContext": {
																			"properties": {
																				"allowPrivilegeEscalation": {
																					"type": "boolean"
																				}
																				"capabilities": {
																					"properties": {
																						"add": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																						"drop": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"privileged": {
																					"type": "boolean"
																				}
																				"procMount": {
																					"type": "string"
																				}
																				"readOnlyRootFilesystem": {
																					"type": "boolean"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"elasticsearchClientNodeOnly": {
																			"type": "boolean"
																		}
																		"elasticsearchNodesWanOnly": {
																			"type": "boolean"
																		}
																		"elasticsearchTimeRange": {
																			"type": "string"
																		}
																		"enabled": {
																			"type": "boolean"
																		}
																		"image": {
																			"type": "string"
																		}
																		"imagePullPolicy": {
																			"type": "string"
																		}
																		"imagePullSecrets": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"javaOpts": {
																			"type": "string"
																		}
																		"labels": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"type": "object"
																		}
																		"livenessProbe": {
																			"properties": {
																				"exec": {
																					"properties": {
																						"command": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"failureThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"grpc": {
																					"properties": {
																						"port": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"service": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"httpGet": {
																					"properties": {
																						"host": {
																							"type": "string"
																						}
																						"httpHeaders": {
																							"items": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																									"value": {
																										"type": "string"
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
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																						"scheme": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"initialDelaySeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"periodSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"successThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"tcpSocket": {
																					"properties": {
																						"host": {
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"terminationGracePeriodSeconds": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"timeoutSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																			}
																			"type": "object"
																		}
																		"resources": {
																			"nullable": true
																			"properties": {
																				"claims": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"name",
																						]
																						"type": "object"
																					}
																					"type": "array"
																					"x-kubernetes-list-map-keys": [
																						"name",
																					]
																					"x-kubernetes-list-type": "map"
																				}
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
																					"type": "object"
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
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"schedule": {
																			"type": "string"
																		}
																		"securityContext": {
																			"properties": {
																				"fsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"fsGroupChangePolicy": {
																					"type": "string"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"supplementalGroups": {
																					"items": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"type": "array"
																				}
																				"sysctls": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"serviceAccount": {
																			"type": "string"
																		}
																		"sparkMaster": {
																			"type": "string"
																		}
																		"successfulJobsHistoryLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tolerations": {
																			"items": {
																				"properties": {
																					"effect": {
																						"type": "string"
																					}
																					"key": {
																						"type": "string"
																					}
																					"operator": {
																						"type": "string"
																					}
																					"tolerationSeconds": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"value": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"ttlSecondsAfterFinished": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"volumeMounts": {
																			"items": {
																				"properties": {
																					"mountPath": {
																						"type": "string"
																					}
																					"mountPropagation": {
																						"type": "string"
																					}
																					"name": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"subPath": {
																						"type": "string"
																					}
																					"subPathExpr": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"mountPath",
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"volumes": {
																			"items": {
																				"properties": {
																					"awsElasticBlockStore": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"azureDisk": {
																						"properties": {
																							"cachingMode": {
																								"type": "string"
																							}
																							"diskName": {
																								"type": "string"
																							}
																							"diskURI": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"kind": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"diskName",
																							"diskURI",
																						]
																						"type": "object"
																					}
																					"azureFile": {
																						"properties": {
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																							"shareName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"secretName",
																							"shareName",
																						]
																						"type": "object"
																					}
																					"cephfs": {
																						"properties": {
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretFile": {
																								"type": "string"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"monitors",
																						]
																						"type": "object"
																					}
																					"cinder": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"configMap": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"name": {
																								"type": "string"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"csi": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"nodePublishSecretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeAttributes": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"downwardAPI": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"fieldRef": {
																											"properties": {
																												"apiVersion": {
																													"type": "string"
																												}
																												"fieldPath": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"fieldPath",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																										"resourceFieldRef": {
																											"properties": {
																												"containerName": {
																													"type": "string"
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
																													"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																													"x-kubernetes-int-or-string": true
																												}
																												"resource": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"resource",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"emptyDir": {
																						"properties": {
																							"medium": {
																								"type": "string"
																							}
																							"sizeLimit": {
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
																						}
																						"type": "object"
																					}
																					"ephemeral": {
																						"properties": {
																							"volumeClaimTemplate": {
																								"properties": {
																									"metadata": {
																										"properties": {
																											"annotations": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"finalizers": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"labels": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																									"spec": {
																										"properties": {
																											"accessModes": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"dataSource": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"dataSourceRef": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																													"namespace": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type": "object"
																											}
																											"resources": {
																												"properties": {
																													"claims": {
																														"items": {
																															"properties": {
																																"name": {
																																	"type": "string"
																																}
																															}
																															"required": [
																																"name",
																															]
																															"type": "object"
																														}
																														"type": "array"
																														"x-kubernetes-list-map-keys": [
																															"name",
																														]
																														"x-kubernetes-list-type": "map"
																													}
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
																														"type": "object"
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
																														"type": "object"
																													}
																												}
																												"type": "object"
																											}
																											"selector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"storageClassName": {
																												"type": "string"
																											}
																											"volumeMode": {
																												"type": "string"
																											}
																											"volumeName": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																								}
																								"required": [
																									"spec",
																								]
																								"type": "object"
																							}
																						}
																						"type": "object"
																					}
																					"fc": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"targetWWNs": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"wwids": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"flexVolume": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"options": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"flocker": {
																						"properties": {
																							"datasetName": {
																								"type": "string"
																							}
																							"datasetUUID": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"gcePersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"pdName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"pdName",
																						]
																						"type": "object"
																					}
																					"gitRepo": {
																						"properties": {
																							"directory": {
																								"type": "string"
																							}
																							"repository": {
																								"type": "string"
																							}
																							"revision": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"repository",
																						]
																						"type": "object"
																					}
																					"glusterfs": {
																						"properties": {
																							"endpoints": {
																								"type": "string"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"endpoints",
																							"path",
																						]
																						"type": "object"
																					}
																					"hostPath": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"type": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																						]
																						"type": "object"
																					}
																					"iscsi": {
																						"properties": {
																							"chapAuthDiscovery": {
																								"type": "boolean"
																							}
																							"chapAuthSession": {
																								"type": "boolean"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"initiatorName": {
																								"type": "string"
																							}
																							"iqn": {
																								"type": "string"
																							}
																							"iscsiInterface": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"portals": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"targetPortal": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"iqn",
																							"lun",
																							"targetPortal",
																						]
																						"type": "object"
																					}
																					"name": {
																						"type": "string"
																					}
																					"nfs": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"server": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																							"server",
																						]
																						"type": "object"
																					}
																					"persistentVolumeClaim": {
																						"properties": {
																							"claimName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"claimName",
																						]
																						"type": "object"
																					}
																					"photonPersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"pdID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"pdID",
																						]
																						"type": "object"
																					}
																					"portworxVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"projected": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"sources": {
																								"items": {
																									"properties": {
																										"configMap": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"downwardAPI": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"fieldRef": {
																																"properties": {
																																	"apiVersion": {
																																		"type": "string"
																																	}
																																	"fieldPath": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"fieldPath",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																															"resourceFieldRef": {
																																"properties": {
																																	"containerName": {
																																		"type": "string"
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
																																		"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																		"x-kubernetes-int-or-string": true
																																	}
																																	"resource": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"resource",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																														}
																														"required": [
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																											}
																											"type": "object"
																										}
																										"secret": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"serviceAccountToken": {
																											"properties": {
																												"audience": {
																													"type": "string"
																												}
																												"expirationSeconds": {
																													"format": "int64"
																													"type":   "integer"
																												}
																												"path": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"path",
																											]
																											"type": "object"
																										}
																									}
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"quobyte": {
																						"properties": {
																							"group": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"registry": {
																								"type": "string"
																							}
																							"tenant": {
																								"type": "string"
																							}
																							"user": {
																								"type": "string"
																							}
																							"volume": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"registry",
																							"volume",
																						]
																						"type": "object"
																					}
																					"rbd": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"image": {
																								"type": "string"
																							}
																							"keyring": {
																								"type": "string"
																							}
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"pool": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"image",
																							"monitors",
																						]
																						"type": "object"
																					}
																					"scaleIO": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"gateway": {
																								"type": "string"
																							}
																							"protectionDomain": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"sslEnabled": {
																								"type": "boolean"
																							}
																							"storageMode": {
																								"type": "string"
																							}
																							"storagePool": {
																								"type": "string"
																							}
																							"system": {
																								"type": "string"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"gateway",
																							"secretRef",
																							"system",
																						]
																						"type": "object"
																					}
																					"secret": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"storageos": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																							"volumeNamespace": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"vsphereVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"storagePolicyID": {
																								"type": "string"
																							}
																							"storagePolicyName": {
																								"type": "string"
																							}
																							"volumePath": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumePath",
																						]
																						"type": "object"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																	}
																	"type": "object"
																}
																"elasticsearch": {
																	"properties": {
																		"doNotProvision": {
																			"type": "boolean"
																		}
																		"image": {
																			"type": "string"
																		}
																		"name": {
																			"type": "string"
																		}
																		"nodeCount": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"nodeSelector": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"type": "object"
																		}
																		"proxyResources": {
																			"properties": {
																				"claims": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"name",
																						]
																						"type": "object"
																					}
																					"type": "array"
																					"x-kubernetes-list-map-keys": [
																						"name",
																					]
																					"x-kubernetes-list-type": "map"
																				}
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
																					"type": "object"
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
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"redundancyPolicy": {
																			"enum": [
																				"FullRedundancy",
																				"MultipleRedundancy",
																				"SingleRedundancy",
																				"ZeroRedundancy",
																			]
																			"type": "string"
																		}
																		"resources": {
																			"properties": {
																				"claims": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"name",
																						]
																						"type": "object"
																					}
																					"type": "array"
																					"x-kubernetes-list-map-keys": [
																						"name",
																					]
																					"x-kubernetes-list-type": "map"
																				}
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
																					"type": "object"
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
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"storage": {
																			"properties": {
																				"size": {
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
																				"storageClassName": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"tolerations": {
																			"items": {
																				"properties": {
																					"effect": {
																						"type": "string"
																					}
																					"key": {
																						"type": "string"
																					}
																					"operator": {
																						"type": "string"
																					}
																					"tolerationSeconds": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"value": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"useCertManagement": {
																			"type": "boolean"
																		}
																	}
																	"type": "object"
																}
																"esIndexCleaner": {
																	"properties": {
																		"affinity": {
																			"properties": {
																				"nodeAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"preference": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"properties": {
																								"nodeSelectorTerms": {
																									"items": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"nodeSelectorTerms",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																					}
																					"type": "object"
																				}
																				"podAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																		"annotations": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"nullable": true
																			"type":     "object"
																		}
																		"backoffLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"containerSecurityContext": {
																			"properties": {
																				"allowPrivilegeEscalation": {
																					"type": "boolean"
																				}
																				"capabilities": {
																					"properties": {
																						"add": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																						"drop": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"privileged": {
																					"type": "boolean"
																				}
																				"procMount": {
																					"type": "string"
																				}
																				"readOnlyRootFilesystem": {
																					"type": "boolean"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"enabled": {
																			"type": "boolean"
																		}
																		"image": {
																			"type": "string"
																		}
																		"imagePullPolicy": {
																			"type": "string"
																		}
																		"imagePullSecrets": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"labels": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"type": "object"
																		}
																		"livenessProbe": {
																			"properties": {
																				"exec": {
																					"properties": {
																						"command": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"failureThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"grpc": {
																					"properties": {
																						"port": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"service": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"httpGet": {
																					"properties": {
																						"host": {
																							"type": "string"
																						}
																						"httpHeaders": {
																							"items": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																									"value": {
																										"type": "string"
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
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																						"scheme": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"initialDelaySeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"periodSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"successThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"tcpSocket": {
																					"properties": {
																						"host": {
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"terminationGracePeriodSeconds": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"timeoutSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																			}
																			"type": "object"
																		}
																		"numberOfDays": {
																			"type": "integer"
																		}
																		"priorityClassName": {
																			"type": "string"
																		}
																		"resources": {
																			"nullable": true
																			"properties": {
																				"claims": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"name",
																						]
																						"type": "object"
																					}
																					"type": "array"
																					"x-kubernetes-list-map-keys": [
																						"name",
																					]
																					"x-kubernetes-list-type": "map"
																				}
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
																					"type": "object"
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
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"schedule": {
																			"type": "string"
																		}
																		"securityContext": {
																			"properties": {
																				"fsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"fsGroupChangePolicy": {
																					"type": "string"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"supplementalGroups": {
																					"items": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"type": "array"
																				}
																				"sysctls": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"serviceAccount": {
																			"type": "string"
																		}
																		"successfulJobsHistoryLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tolerations": {
																			"items": {
																				"properties": {
																					"effect": {
																						"type": "string"
																					}
																					"key": {
																						"type": "string"
																					}
																					"operator": {
																						"type": "string"
																					}
																					"tolerationSeconds": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"value": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"ttlSecondsAfterFinished": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"volumeMounts": {
																			"items": {
																				"properties": {
																					"mountPath": {
																						"type": "string"
																					}
																					"mountPropagation": {
																						"type": "string"
																					}
																					"name": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"subPath": {
																						"type": "string"
																					}
																					"subPathExpr": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"mountPath",
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"volumes": {
																			"items": {
																				"properties": {
																					"awsElasticBlockStore": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"azureDisk": {
																						"properties": {
																							"cachingMode": {
																								"type": "string"
																							}
																							"diskName": {
																								"type": "string"
																							}
																							"diskURI": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"kind": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"diskName",
																							"diskURI",
																						]
																						"type": "object"
																					}
																					"azureFile": {
																						"properties": {
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																							"shareName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"secretName",
																							"shareName",
																						]
																						"type": "object"
																					}
																					"cephfs": {
																						"properties": {
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretFile": {
																								"type": "string"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"monitors",
																						]
																						"type": "object"
																					}
																					"cinder": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"configMap": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"name": {
																								"type": "string"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"csi": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"nodePublishSecretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeAttributes": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"downwardAPI": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"fieldRef": {
																											"properties": {
																												"apiVersion": {
																													"type": "string"
																												}
																												"fieldPath": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"fieldPath",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																										"resourceFieldRef": {
																											"properties": {
																												"containerName": {
																													"type": "string"
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
																													"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																													"x-kubernetes-int-or-string": true
																												}
																												"resource": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"resource",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"emptyDir": {
																						"properties": {
																							"medium": {
																								"type": "string"
																							}
																							"sizeLimit": {
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
																						}
																						"type": "object"
																					}
																					"ephemeral": {
																						"properties": {
																							"volumeClaimTemplate": {
																								"properties": {
																									"metadata": {
																										"properties": {
																											"annotations": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"finalizers": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"labels": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																									"spec": {
																										"properties": {
																											"accessModes": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"dataSource": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"dataSourceRef": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																													"namespace": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type": "object"
																											}
																											"resources": {
																												"properties": {
																													"claims": {
																														"items": {
																															"properties": {
																																"name": {
																																	"type": "string"
																																}
																															}
																															"required": [
																																"name",
																															]
																															"type": "object"
																														}
																														"type": "array"
																														"x-kubernetes-list-map-keys": [
																															"name",
																														]
																														"x-kubernetes-list-type": "map"
																													}
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
																														"type": "object"
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
																														"type": "object"
																													}
																												}
																												"type": "object"
																											}
																											"selector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"storageClassName": {
																												"type": "string"
																											}
																											"volumeMode": {
																												"type": "string"
																											}
																											"volumeName": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																								}
																								"required": [
																									"spec",
																								]
																								"type": "object"
																							}
																						}
																						"type": "object"
																					}
																					"fc": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"targetWWNs": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"wwids": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"flexVolume": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"options": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"flocker": {
																						"properties": {
																							"datasetName": {
																								"type": "string"
																							}
																							"datasetUUID": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"gcePersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"pdName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"pdName",
																						]
																						"type": "object"
																					}
																					"gitRepo": {
																						"properties": {
																							"directory": {
																								"type": "string"
																							}
																							"repository": {
																								"type": "string"
																							}
																							"revision": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"repository",
																						]
																						"type": "object"
																					}
																					"glusterfs": {
																						"properties": {
																							"endpoints": {
																								"type": "string"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"endpoints",
																							"path",
																						]
																						"type": "object"
																					}
																					"hostPath": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"type": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																						]
																						"type": "object"
																					}
																					"iscsi": {
																						"properties": {
																							"chapAuthDiscovery": {
																								"type": "boolean"
																							}
																							"chapAuthSession": {
																								"type": "boolean"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"initiatorName": {
																								"type": "string"
																							}
																							"iqn": {
																								"type": "string"
																							}
																							"iscsiInterface": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"portals": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"targetPortal": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"iqn",
																							"lun",
																							"targetPortal",
																						]
																						"type": "object"
																					}
																					"name": {
																						"type": "string"
																					}
																					"nfs": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"server": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																							"server",
																						]
																						"type": "object"
																					}
																					"persistentVolumeClaim": {
																						"properties": {
																							"claimName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"claimName",
																						]
																						"type": "object"
																					}
																					"photonPersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"pdID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"pdID",
																						]
																						"type": "object"
																					}
																					"portworxVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"projected": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"sources": {
																								"items": {
																									"properties": {
																										"configMap": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"downwardAPI": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"fieldRef": {
																																"properties": {
																																	"apiVersion": {
																																		"type": "string"
																																	}
																																	"fieldPath": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"fieldPath",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																															"resourceFieldRef": {
																																"properties": {
																																	"containerName": {
																																		"type": "string"
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
																																		"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																		"x-kubernetes-int-or-string": true
																																	}
																																	"resource": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"resource",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																														}
																														"required": [
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																											}
																											"type": "object"
																										}
																										"secret": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"serviceAccountToken": {
																											"properties": {
																												"audience": {
																													"type": "string"
																												}
																												"expirationSeconds": {
																													"format": "int64"
																													"type":   "integer"
																												}
																												"path": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"path",
																											]
																											"type": "object"
																										}
																									}
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"quobyte": {
																						"properties": {
																							"group": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"registry": {
																								"type": "string"
																							}
																							"tenant": {
																								"type": "string"
																							}
																							"user": {
																								"type": "string"
																							}
																							"volume": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"registry",
																							"volume",
																						]
																						"type": "object"
																					}
																					"rbd": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"image": {
																								"type": "string"
																							}
																							"keyring": {
																								"type": "string"
																							}
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"pool": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"image",
																							"monitors",
																						]
																						"type": "object"
																					}
																					"scaleIO": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"gateway": {
																								"type": "string"
																							}
																							"protectionDomain": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"sslEnabled": {
																								"type": "boolean"
																							}
																							"storageMode": {
																								"type": "string"
																							}
																							"storagePool": {
																								"type": "string"
																							}
																							"system": {
																								"type": "string"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"gateway",
																							"secretRef",
																							"system",
																						]
																						"type": "object"
																					}
																					"secret": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"storageos": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																							"volumeNamespace": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"vsphereVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"storagePolicyID": {
																								"type": "string"
																							}
																							"storagePolicyName": {
																								"type": "string"
																							}
																							"volumePath": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumePath",
																						]
																						"type": "object"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																	}
																	"type": "object"
																}
																"esRollover": {
																	"properties": {
																		"affinity": {
																			"properties": {
																				"nodeAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"preference": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"properties": {
																								"nodeSelectorTerms": {
																									"items": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"type": "array"
																								}
																							}
																							"required": [
																								"nodeSelectorTerms",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																					}
																					"type": "object"
																				}
																				"podAffinity": {
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																					"properties": {
																						"preferredDuringSchedulingIgnoredDuringExecution": {
																							"items": {
																								"properties": {
																									"podAffinityTerm": {
																										"properties": {
																											"labelSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaceSelector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"namespaces": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"topologyKey": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"topologyKey",
																										]
																										"type": "object"
																									}
																									"weight": {
																										"format": "int32"
																										"type":   "integer"
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
																							"items": {
																								"properties": {
																									"labelSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaceSelector": {
																										"properties": {
																											"matchExpressions": {
																												"items": {
																													"properties": {
																														"key": {
																															"type": "string"
																														}
																														"operator": {
																															"type": "string"
																														}
																														"values": {
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
																												"type": "object"
																											}
																										}
																										"type":                  "object"
																										"x-kubernetes-map-type": "atomic"
																									}
																									"namespaces": {
																										"items": {
																											"type": "string"
																										}
																										"type": "array"
																									}
																									"topologyKey": {
																										"type": "string"
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
																		"annotations": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"nullable": true
																			"type":     "object"
																		}
																		"backoffLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"conditions": {
																			"type": "string"
																		}
																		"containerSecurityContext": {
																			"properties": {
																				"allowPrivilegeEscalation": {
																					"type": "boolean"
																				}
																				"capabilities": {
																					"properties": {
																						"add": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																						"drop": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"privileged": {
																					"type": "boolean"
																				}
																				"procMount": {
																					"type": "string"
																				}
																				"readOnlyRootFilesystem": {
																					"type": "boolean"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"image": {
																			"type": "string"
																		}
																		"imagePullPolicy": {
																			"type": "string"
																		}
																		"imagePullSecrets": {
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"labels": {
																			"additionalProperties": {
																				"type": "string"
																			}
																			"type": "object"
																		}
																		"livenessProbe": {
																			"properties": {
																				"exec": {
																					"properties": {
																						"command": {
																							"items": {
																								"type": "string"
																							}
																							"type": "array"
																						}
																					}
																					"type": "object"
																				}
																				"failureThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"grpc": {
																					"properties": {
																						"port": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"service": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"httpGet": {
																					"properties": {
																						"host": {
																							"type": "string"
																						}
																						"httpHeaders": {
																							"items": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																									"value": {
																										"type": "string"
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
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																						"scheme": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"initialDelaySeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"periodSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"successThreshold": {
																					"format": "int32"
																					"type":   "integer"
																				}
																				"tcpSocket": {
																					"properties": {
																						"host": {
																							"type": "string"
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
																							"x-kubernetes-int-or-string": true
																						}
																					}
																					"required": [
																						"port",
																					]
																					"type": "object"
																				}
																				"terminationGracePeriodSeconds": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"timeoutSeconds": {
																					"format": "int32"
																					"type":   "integer"
																				}
																			}
																			"type": "object"
																		}
																		"readTTL": {
																			"type": "string"
																		}
																		"resources": {
																			"nullable": true
																			"properties": {
																				"claims": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"name",
																						]
																						"type": "object"
																					}
																					"type": "array"
																					"x-kubernetes-list-map-keys": [
																						"name",
																					]
																					"x-kubernetes-list-type": "map"
																				}
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
																					"type": "object"
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
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"schedule": {
																			"type": "string"
																		}
																		"securityContext": {
																			"properties": {
																				"fsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"fsGroupChangePolicy": {
																					"type": "string"
																				}
																				"runAsGroup": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"runAsNonRoot": {
																					"type": "boolean"
																				}
																				"runAsUser": {
																					"format": "int64"
																					"type":   "integer"
																				}
																				"seLinuxOptions": {
																					"properties": {
																						"level": {
																							"type": "string"
																						}
																						"role": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																						"user": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																				"seccompProfile": {
																					"properties": {
																						"localhostProfile": {
																							"type": "string"
																						}
																						"type": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"type",
																					]
																					"type": "object"
																				}
																				"supplementalGroups": {
																					"items": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"type": "array"
																				}
																				"sysctls": {
																					"items": {
																						"properties": {
																							"name": {
																								"type": "string"
																							}
																							"value": {
																								"type": "string"
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
																				"windowsOptions": {
																					"properties": {
																						"gmsaCredentialSpec": {
																							"type": "string"
																						}
																						"gmsaCredentialSpecName": {
																							"type": "string"
																						}
																						"hostProcess": {
																							"type": "boolean"
																						}
																						"runAsUserName": {
																							"type": "string"
																						}
																					}
																					"type": "object"
																				}
																			}
																			"type": "object"
																		}
																		"serviceAccount": {
																			"type": "string"
																		}
																		"successfulJobsHistoryLimit": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"tolerations": {
																			"items": {
																				"properties": {
																					"effect": {
																						"type": "string"
																					}
																					"key": {
																						"type": "string"
																					}
																					"operator": {
																						"type": "string"
																					}
																					"tolerationSeconds": {
																						"format": "int64"
																						"type":   "integer"
																					}
																					"value": {
																						"type": "string"
																					}
																				}
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"ttlSecondsAfterFinished": {
																			"format": "int32"
																			"type":   "integer"
																		}
																		"volumeMounts": {
																			"items": {
																				"properties": {
																					"mountPath": {
																						"type": "string"
																					}
																					"mountPropagation": {
																						"type": "string"
																					}
																					"name": {
																						"type": "string"
																					}
																					"readOnly": {
																						"type": "boolean"
																					}
																					"subPath": {
																						"type": "string"
																					}
																					"subPathExpr": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"mountPath",
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		"volumes": {
																			"items": {
																				"properties": {
																					"awsElasticBlockStore": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"azureDisk": {
																						"properties": {
																							"cachingMode": {
																								"type": "string"
																							}
																							"diskName": {
																								"type": "string"
																							}
																							"diskURI": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"kind": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"diskName",
																							"diskURI",
																						]
																						"type": "object"
																					}
																					"azureFile": {
																						"properties": {
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																							"shareName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"secretName",
																							"shareName",
																						]
																						"type": "object"
																					}
																					"cephfs": {
																						"properties": {
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretFile": {
																								"type": "string"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"monitors",
																						]
																						"type": "object"
																					}
																					"cinder": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"configMap": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"name": {
																								"type": "string"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																						}
																						"type":                  "object"
																						"x-kubernetes-map-type": "atomic"
																					}
																					"csi": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"nodePublishSecretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeAttributes": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"downwardAPI": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"fieldRef": {
																											"properties": {
																												"apiVersion": {
																													"type": "string"
																												}
																												"fieldPath": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"fieldPath",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																										"resourceFieldRef": {
																											"properties": {
																												"containerName": {
																													"type": "string"
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
																													"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																													"x-kubernetes-int-or-string": true
																												}
																												"resource": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"resource",
																											]
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																									}
																									"required": [
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"emptyDir": {
																						"properties": {
																							"medium": {
																								"type": "string"
																							}
																							"sizeLimit": {
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
																						}
																						"type": "object"
																					}
																					"ephemeral": {
																						"properties": {
																							"volumeClaimTemplate": {
																								"properties": {
																									"metadata": {
																										"properties": {
																											"annotations": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"finalizers": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"labels": {
																												"additionalProperties": {
																													"type": "string"
																												}
																												"type": "object"
																											}
																											"name": {
																												"type": "string"
																											}
																											"namespace": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																									"spec": {
																										"properties": {
																											"accessModes": {
																												"items": {
																													"type": "string"
																												}
																												"type": "array"
																											}
																											"dataSource": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"dataSourceRef": {
																												"properties": {
																													"apiGroup": {
																														"type": "string"
																													}
																													"kind": {
																														"type": "string"
																													}
																													"name": {
																														"type": "string"
																													}
																													"namespace": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"kind",
																													"name",
																												]
																												"type": "object"
																											}
																											"resources": {
																												"properties": {
																													"claims": {
																														"items": {
																															"properties": {
																																"name": {
																																	"type": "string"
																																}
																															}
																															"required": [
																																"name",
																															]
																															"type": "object"
																														}
																														"type": "array"
																														"x-kubernetes-list-map-keys": [
																															"name",
																														]
																														"x-kubernetes-list-type": "map"
																													}
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
																														"type": "object"
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
																														"type": "object"
																													}
																												}
																												"type": "object"
																											}
																											"selector": {
																												"properties": {
																													"matchExpressions": {
																														"items": {
																															"properties": {
																																"key": {
																																	"type": "string"
																																}
																																"operator": {
																																	"type": "string"
																																}
																																"values": {
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
																														"type": "object"
																													}
																												}
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"storageClassName": {
																												"type": "string"
																											}
																											"volumeMode": {
																												"type": "string"
																											}
																											"volumeName": {
																												"type": "string"
																											}
																										}
																										"type": "object"
																									}
																								}
																								"required": [
																									"spec",
																								]
																								"type": "object"
																							}
																						}
																						"type": "object"
																					}
																					"fc": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"targetWWNs": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"wwids": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"flexVolume": {
																						"properties": {
																							"driver": {
																								"type": "string"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"options": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																						}
																						"required": [
																							"driver",
																						]
																						"type": "object"
																					}
																					"flocker": {
																						"properties": {
																							"datasetName": {
																								"type": "string"
																							}
																							"datasetUUID": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"gcePersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"partition": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"pdName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"pdName",
																						]
																						"type": "object"
																					}
																					"gitRepo": {
																						"properties": {
																							"directory": {
																								"type": "string"
																							}
																							"repository": {
																								"type": "string"
																							}
																							"revision": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"repository",
																						]
																						"type": "object"
																					}
																					"glusterfs": {
																						"properties": {
																							"endpoints": {
																								"type": "string"
																							}
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"endpoints",
																							"path",
																						]
																						"type": "object"
																					}
																					"hostPath": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"type": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																						]
																						"type": "object"
																					}
																					"iscsi": {
																						"properties": {
																							"chapAuthDiscovery": {
																								"type": "boolean"
																							}
																							"chapAuthSession": {
																								"type": "boolean"
																							}
																							"fsType": {
																								"type": "string"
																							}
																							"initiatorName": {
																								"type": "string"
																							}
																							"iqn": {
																								"type": "string"
																							}
																							"iscsiInterface": {
																								"type": "string"
																							}
																							"lun": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"portals": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"targetPortal": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"iqn",
																							"lun",
																							"targetPortal",
																						]
																						"type": "object"
																					}
																					"name": {
																						"type": "string"
																					}
																					"nfs": {
																						"properties": {
																							"path": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"server": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"path",
																							"server",
																						]
																						"type": "object"
																					}
																					"persistentVolumeClaim": {
																						"properties": {
																							"claimName": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																						}
																						"required": [
																							"claimName",
																						]
																						"type": "object"
																					}
																					"photonPersistentDisk": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"pdID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"pdID",
																						]
																						"type": "object"
																					}
																					"portworxVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"volumeID": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumeID",
																						]
																						"type": "object"
																					}
																					"projected": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"sources": {
																								"items": {
																									"properties": {
																										"configMap": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"downwardAPI": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"fieldRef": {
																																"properties": {
																																	"apiVersion": {
																																		"type": "string"
																																	}
																																	"fieldPath": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"fieldPath",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																															"resourceFieldRef": {
																																"properties": {
																																	"containerName": {
																																		"type": "string"
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
																																		"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																																		"x-kubernetes-int-or-string": true
																																	}
																																	"resource": {
																																		"type": "string"
																																	}
																																}
																																"required": [
																																	"resource",
																																]
																																"type":                  "object"
																																"x-kubernetes-map-type": "atomic"
																															}
																														}
																														"required": [
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																											}
																											"type": "object"
																										}
																										"secret": {
																											"properties": {
																												"items": {
																													"items": {
																														"properties": {
																															"key": {
																																"type": "string"
																															}
																															"mode": {
																																"format": "int32"
																																"type":   "integer"
																															}
																															"path": {
																																"type": "string"
																															}
																														}
																														"required": [
																															"key",
																															"path",
																														]
																														"type": "object"
																													}
																													"type": "array"
																												}
																												"name": {
																													"type": "string"
																												}
																												"optional": {
																													"type": "boolean"
																												}
																											}
																											"type":                  "object"
																											"x-kubernetes-map-type": "atomic"
																										}
																										"serviceAccountToken": {
																											"properties": {
																												"audience": {
																													"type": "string"
																												}
																												"expirationSeconds": {
																													"format": "int64"
																													"type":   "integer"
																												}
																												"path": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"path",
																											]
																											"type": "object"
																										}
																									}
																									"type": "object"
																								}
																								"type": "array"
																							}
																						}
																						"type": "object"
																					}
																					"quobyte": {
																						"properties": {
																							"group": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"registry": {
																								"type": "string"
																							}
																							"tenant": {
																								"type": "string"
																							}
																							"user": {
																								"type": "string"
																							}
																							"volume": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"registry",
																							"volume",
																						]
																						"type": "object"
																					}
																					"rbd": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"image": {
																								"type": "string"
																							}
																							"keyring": {
																								"type": "string"
																							}
																							"monitors": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"pool": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"user": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"image",
																							"monitors",
																						]
																						"type": "object"
																					}
																					"scaleIO": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"gateway": {
																								"type": "string"
																							}
																							"protectionDomain": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"sslEnabled": {
																								"type": "boolean"
																							}
																							"storageMode": {
																								"type": "string"
																							}
																							"storagePool": {
																								"type": "string"
																							}
																							"system": {
																								"type": "string"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"gateway",
																							"secretRef",
																							"system",
																						]
																						"type": "object"
																					}
																					"secret": {
																						"properties": {
																							"defaultMode": {
																								"format": "int32"
																								"type":   "integer"
																							}
																							"items": {
																								"items": {
																									"properties": {
																										"key": {
																											"type": "string"
																										}
																										"mode": {
																											"format": "int32"
																											"type":   "integer"
																										}
																										"path": {
																											"type": "string"
																										}
																									}
																									"required": [
																										"key",
																										"path",
																									]
																									"type": "object"
																								}
																								"type": "array"
																							}
																							"optional": {
																								"type": "boolean"
																							}
																							"secretName": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"storageos": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"readOnly": {
																								"type": "boolean"
																							}
																							"secretRef": {
																								"properties": {
																									"name": {
																										"type": "string"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																							"volumeNamespace": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"vsphereVolume": {
																						"properties": {
																							"fsType": {
																								"type": "string"
																							}
																							"storagePolicyID": {
																								"type": "string"
																							}
																							"storagePolicyName": {
																								"type": "string"
																							}
																							"volumePath": {
																								"type": "string"
																							}
																						}
																						"required": [
																							"volumePath",
																						]
																						"type": "object"
																					}
																				}
																				"required": [
																					"name",
																				]
																				"type": "object"
																			}
																			"type":                   "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																	}
																	"type": "object"
																}
																"grpcPlugin": {
																	"properties": {
																		"image": {
																			"type": "string"
																		}
																	}
																	"type": "object"
																}
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
																"secretName": {
																	"type": "string"
																}
																"type": {
																	"type": "string"
																}
															}
															"type": "object"
														}
														"strategy": {
															"type": "string"
														}
														"tolerations": {
															"items": {
																"properties": {
																	"effect": {
																		"type": "string"
																	}
																	"key": {
																		"type": "string"
																	}
																	"operator": {
																		"type": "string"
																	}
																	"tolerationSeconds": {
																		"format": "int64"
																		"type":   "integer"
																	}
																	"value": {
																		"type": "string"
																	}
																}
																"type": "object"
															}
															"type":                   "array"
															"x-kubernetes-list-type": "atomic"
														}
														"ui": {
															"properties": {
																"options": {
																	"type":                                 "object"
																	"x-kubernetes-preserve-unknown-fields": true
																}
															}
															"type": "object"
														}
														"volumeMounts": {
															"items": {
																"properties": {
																	"mountPath": {
																		"type": "string"
																	}
																	"mountPropagation": {
																		"type": "string"
																	}
																	"name": {
																		"type": "string"
																	}
																	"readOnly": {
																		"type": "boolean"
																	}
																	"subPath": {
																		"type": "string"
																	}
																	"subPathExpr": {
																		"type": "string"
																	}
																}
																"required": [
																	"mountPath",
																	"name",
																]
																"type": "object"
															}
															"type":                   "array"
															"x-kubernetes-list-type": "atomic"
														}
														"volumes": {
															"items": {
																"properties": {
																	"awsElasticBlockStore": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"partition": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"volumeID": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"volumeID",
																		]
																		"type": "object"
																	}
																	"azureDisk": {
																		"properties": {
																			"cachingMode": {
																				"type": "string"
																			}
																			"diskName": {
																				"type": "string"
																			}
																			"diskURI": {
																				"type": "string"
																			}
																			"fsType": {
																				"type": "string"
																			}
																			"kind": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																		}
																		"required": [
																			"diskName",
																			"diskURI",
																		]
																		"type": "object"
																	}
																	"azureFile": {
																		"properties": {
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretName": {
																				"type": "string"
																			}
																			"shareName": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"secretName",
																			"shareName",
																		]
																		"type": "object"
																	}
																	"cephfs": {
																		"properties": {
																			"monitors": {
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"path": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretFile": {
																				"type": "string"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"user": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"monitors",
																		]
																		"type": "object"
																	}
																	"cinder": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"volumeID": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"volumeID",
																		]
																		"type": "object"
																	}
																	"configMap": {
																		"properties": {
																			"defaultMode": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"items": {
																				"items": {
																					"properties": {
																						"key": {
																							"type": "string"
																						}
																						"mode": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"path": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"key",
																						"path",
																					]
																					"type": "object"
																				}
																				"type": "array"
																			}
																			"name": {
																				"type": "string"
																			}
																			"optional": {
																				"type": "boolean"
																			}
																		}
																		"type":                  "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	"csi": {
																		"properties": {
																			"driver": {
																				"type": "string"
																			}
																			"fsType": {
																				"type": "string"
																			}
																			"nodePublishSecretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"volumeAttributes": {
																				"additionalProperties": {
																					"type": "string"
																				}
																				"type": "object"
																			}
																		}
																		"required": [
																			"driver",
																		]
																		"type": "object"
																	}
																	"downwardAPI": {
																		"properties": {
																			"defaultMode": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"items": {
																				"items": {
																					"properties": {
																						"fieldRef": {
																							"properties": {
																								"apiVersion": {
																									"type": "string"
																								}
																								"fieldPath": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"fieldPath",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																						"mode": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"path": {
																							"type": "string"
																						}
																						"resourceFieldRef": {
																							"properties": {
																								"containerName": {
																									"type": "string"
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
																									"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																									"x-kubernetes-int-or-string": true
																								}
																								"resource": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"resource",
																							]
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																					}
																					"required": [
																						"path",
																					]
																					"type": "object"
																				}
																				"type": "array"
																			}
																		}
																		"type": "object"
																	}
																	"emptyDir": {
																		"properties": {
																			"medium": {
																				"type": "string"
																			}
																			"sizeLimit": {
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
																		}
																		"type": "object"
																	}
																	"ephemeral": {
																		"properties": {
																			"volumeClaimTemplate": {
																				"properties": {
																					"metadata": {
																						"properties": {
																							"annotations": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																							"finalizers": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"labels": {
																								"additionalProperties": {
																									"type": "string"
																								}
																								"type": "object"
																							}
																							"name": {
																								"type": "string"
																							}
																							"namespace": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																					"spec": {
																						"properties": {
																							"accessModes": {
																								"items": {
																									"type": "string"
																								}
																								"type": "array"
																							}
																							"dataSource": {
																								"properties": {
																									"apiGroup": {
																										"type": "string"
																									}
																									"kind": {
																										"type": "string"
																									}
																									"name": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"kind",
																									"name",
																								]
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"dataSourceRef": {
																								"properties": {
																									"apiGroup": {
																										"type": "string"
																									}
																									"kind": {
																										"type": "string"
																									}
																									"name": {
																										"type": "string"
																									}
																									"namespace": {
																										"type": "string"
																									}
																								}
																								"required": [
																									"kind",
																									"name",
																								]
																								"type": "object"
																							}
																							"resources": {
																								"properties": {
																									"claims": {
																										"items": {
																											"properties": {
																												"name": {
																													"type": "string"
																												}
																											}
																											"required": [
																												"name",
																											]
																											"type": "object"
																										}
																										"type": "array"
																										"x-kubernetes-list-map-keys": [
																											"name",
																										]
																										"x-kubernetes-list-type": "map"
																									}
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
																										"type": "object"
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
																										"type": "object"
																									}
																								}
																								"type": "object"
																							}
																							"selector": {
																								"properties": {
																									"matchExpressions": {
																										"items": {
																											"properties": {
																												"key": {
																													"type": "string"
																												}
																												"operator": {
																													"type": "string"
																												}
																												"values": {
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
																										"type": "object"
																									}
																								}
																								"type":                  "object"
																								"x-kubernetes-map-type": "atomic"
																							}
																							"storageClassName": {
																								"type": "string"
																							}
																							"volumeMode": {
																								"type": "string"
																							}
																							"volumeName": {
																								"type": "string"
																							}
																						}
																						"type": "object"
																					}
																				}
																				"required": [
																					"spec",
																				]
																				"type": "object"
																			}
																		}
																		"type": "object"
																	}
																	"fc": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"lun": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"targetWWNs": {
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"wwids": {
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																		}
																		"type": "object"
																	}
																	"flexVolume": {
																		"properties": {
																			"driver": {
																				"type": "string"
																			}
																			"fsType": {
																				"type": "string"
																			}
																			"options": {
																				"additionalProperties": {
																					"type": "string"
																				}
																				"type": "object"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																		}
																		"required": [
																			"driver",
																		]
																		"type": "object"
																	}
																	"flocker": {
																		"properties": {
																			"datasetName": {
																				"type": "string"
																			}
																			"datasetUUID": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"gcePersistentDisk": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"partition": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"pdName": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																		}
																		"required": [
																			"pdName",
																		]
																		"type": "object"
																	}
																	"gitRepo": {
																		"properties": {
																			"directory": {
																				"type": "string"
																			}
																			"repository": {
																				"type": "string"
																			}
																			"revision": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"repository",
																		]
																		"type": "object"
																	}
																	"glusterfs": {
																		"properties": {
																			"endpoints": {
																				"type": "string"
																			}
																			"path": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																		}
																		"required": [
																			"endpoints",
																			"path",
																		]
																		"type": "object"
																	}
																	"hostPath": {
																		"properties": {
																			"path": {
																				"type": "string"
																			}
																			"type": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"path",
																		]
																		"type": "object"
																	}
																	"iscsi": {
																		"properties": {
																			"chapAuthDiscovery": {
																				"type": "boolean"
																			}
																			"chapAuthSession": {
																				"type": "boolean"
																			}
																			"fsType": {
																				"type": "string"
																			}
																			"initiatorName": {
																				"type": "string"
																			}
																			"iqn": {
																				"type": "string"
																			}
																			"iscsiInterface": {
																				"type": "string"
																			}
																			"lun": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"portals": {
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"targetPortal": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"iqn",
																			"lun",
																			"targetPortal",
																		]
																		"type": "object"
																	}
																	"name": {
																		"type": "string"
																	}
																	"nfs": {
																		"properties": {
																			"path": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"server": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"path",
																			"server",
																		]
																		"type": "object"
																	}
																	"persistentVolumeClaim": {
																		"properties": {
																			"claimName": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																		}
																		"required": [
																			"claimName",
																		]
																		"type": "object"
																	}
																	"photonPersistentDisk": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"pdID": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"pdID",
																		]
																		"type": "object"
																	}
																	"portworxVolume": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"volumeID": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"volumeID",
																		]
																		"type": "object"
																	}
																	"projected": {
																		"properties": {
																			"defaultMode": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"sources": {
																				"items": {
																					"properties": {
																						"configMap": {
																							"properties": {
																								"items": {
																									"items": {
																										"properties": {
																											"key": {
																												"type": "string"
																											}
																											"mode": {
																												"format": "int32"
																												"type":   "integer"
																											}
																											"path": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"key",
																											"path",
																										]
																										"type": "object"
																									}
																									"type": "array"
																								}
																								"name": {
																									"type": "string"
																								}
																								"optional": {
																									"type": "boolean"
																								}
																							}
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																						"downwardAPI": {
																							"properties": {
																								"items": {
																									"items": {
																										"properties": {
																											"fieldRef": {
																												"properties": {
																													"apiVersion": {
																														"type": "string"
																													}
																													"fieldPath": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"fieldPath",
																												]
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																											"mode": {
																												"format": "int32"
																												"type":   "integer"
																											}
																											"path": {
																												"type": "string"
																											}
																											"resourceFieldRef": {
																												"properties": {
																													"containerName": {
																														"type": "string"
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
																														"pattern":                    "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																														"x-kubernetes-int-or-string": true
																													}
																													"resource": {
																														"type": "string"
																													}
																												}
																												"required": [
																													"resource",
																												]
																												"type":                  "object"
																												"x-kubernetes-map-type": "atomic"
																											}
																										}
																										"required": [
																											"path",
																										]
																										"type": "object"
																									}
																									"type": "array"
																								}
																							}
																							"type": "object"
																						}
																						"secret": {
																							"properties": {
																								"items": {
																									"items": {
																										"properties": {
																											"key": {
																												"type": "string"
																											}
																											"mode": {
																												"format": "int32"
																												"type":   "integer"
																											}
																											"path": {
																												"type": "string"
																											}
																										}
																										"required": [
																											"key",
																											"path",
																										]
																										"type": "object"
																									}
																									"type": "array"
																								}
																								"name": {
																									"type": "string"
																								}
																								"optional": {
																									"type": "boolean"
																								}
																							}
																							"type":                  "object"
																							"x-kubernetes-map-type": "atomic"
																						}
																						"serviceAccountToken": {
																							"properties": {
																								"audience": {
																									"type": "string"
																								}
																								"expirationSeconds": {
																									"format": "int64"
																									"type":   "integer"
																								}
																								"path": {
																									"type": "string"
																								}
																							}
																							"required": [
																								"path",
																							]
																							"type": "object"
																						}
																					}
																					"type": "object"
																				}
																				"type": "array"
																			}
																		}
																		"type": "object"
																	}
																	"quobyte": {
																		"properties": {
																			"group": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"registry": {
																				"type": "string"
																			}
																			"tenant": {
																				"type": "string"
																			}
																			"user": {
																				"type": "string"
																			}
																			"volume": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"registry",
																			"volume",
																		]
																		"type": "object"
																	}
																	"rbd": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"image": {
																				"type": "string"
																			}
																			"keyring": {
																				"type": "string"
																			}
																			"monitors": {
																				"items": {
																					"type": "string"
																				}
																				"type": "array"
																			}
																			"pool": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"user": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"image",
																			"monitors",
																		]
																		"type": "object"
																	}
																	"scaleIO": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"gateway": {
																				"type": "string"
																			}
																			"protectionDomain": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"sslEnabled": {
																				"type": "boolean"
																			}
																			"storageMode": {
																				"type": "string"
																			}
																			"storagePool": {
																				"type": "string"
																			}
																			"system": {
																				"type": "string"
																			}
																			"volumeName": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"gateway",
																			"secretRef",
																			"system",
																		]
																		"type": "object"
																	}
																	"secret": {
																		"properties": {
																			"defaultMode": {
																				"format": "int32"
																				"type":   "integer"
																			}
																			"items": {
																				"items": {
																					"properties": {
																						"key": {
																							"type": "string"
																						}
																						"mode": {
																							"format": "int32"
																							"type":   "integer"
																						}
																						"path": {
																							"type": "string"
																						}
																					}
																					"required": [
																						"key",
																						"path",
																					]
																					"type": "object"
																				}
																				"type": "array"
																			}
																			"optional": {
																				"type": "boolean"
																			}
																			"secretName": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"storageos": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"readOnly": {
																				"type": "boolean"
																			}
																			"secretRef": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																				}
																				"type":                  "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			"volumeName": {
																				"type": "string"
																			}
																			"volumeNamespace": {
																				"type": "string"
																			}
																		}
																		"type": "object"
																	}
																	"vsphereVolume": {
																		"properties": {
																			"fsType": {
																				"type": "string"
																			}
																			"storagePolicyID": {
																				"type": "string"
																			}
																			"storagePolicyName": {
																				"type": "string"
																			}
																			"volumePath": {
																				"type": "string"
																			}
																		}
																		"required": [
																			"volumePath",
																		]
																		"type": "object"
																	}
																}
																"required": [
																	"name",
																]
																"type": "object"
															}
															"type":                   "array"
															"x-kubernetes-list-type": "atomic"
														}
													}
													"type": "object"
												}
												"status": {
													"properties": {
														"phase": {
															"type": "string"
														}
														"version": {
															"type": "string"
														}
													}
													"required": [
														"phase",
														"version",
													]
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
						"apiVersion": "v1"
						"kind":       "ServiceAccount"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "jaeger-operator"
							"namespace": parameter.namespace
						}
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "Role"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "leader-election-role"
							"namespace": parameter.namespace
						}
						"rules": [
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
									"create",
									"update",
									"patch",
									"delete",
								]
							},
							{
								"apiGroups": [
									"coordination.k8s.io",
								]
								"resources": [
									"leases",
								]
								"verbs": [
									"get",
									"list",
									"watch",
									"create",
									"update",
									"patch",
									"delete",
								]
							},
							{
								"apiGroups": [
									"",
								]
								"resources": [
									"events",
								]
								"verbs": [
									"create",
									"patch",
								]
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "Role"
						"metadata": {
							"annotations": {
								"include.release.openshift.io/self-managed-high-availability": "true"
								"include.release.openshift.io/single-node-developer":          "true"
							}
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "prometheus"
							"namespace": parameter.namespace
						}
						"rules": [
							{
								"apiGroups": [
									"",
								]
								"resources": [
									"services",
									"endpoints",
									"pods",
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
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "ClusterRole"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "jaeger-operator-metrics-reader"
						}
						"rules": [
							{
								"nonResourceURLs": [
									"/metrics",
								]
								"verbs": [
									"get",
								]
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "ClusterRole"
						"metadata": {
							"creationTimestamp": null
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "manager-role"
						}
						"rules": [
							{
								"apiGroups": [
									"apps",
								]
								"resources": [
									"daemonsets",
									"deployments",
									"replicasets",
									"statefulsets",
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
									"apps",
								]
								"resources": [
									"deployments",
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
									"apps",
								]
								"resources": [
									"deployments/status",
								]
								"verbs": [
									"get",
									"patch",
									"update",
								]
							},
							{
								"apiGroups": [
									"autoscaling",
								]
								"resources": [
									"horizontalpodautoscalers",
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
									"batch",
								]
								"resources": [
									"cronjobs",
									"jobs",
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
									"console.openshift.io",
								]
								"resources": [
									"consolelinks",
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
									"coordination.k8s.io",
								]
								"resources": [
									"leases",
								]
								"verbs": [
									"create",
									"get",
									"list",
									"update",
								]
							},
							{
								"apiGroups": [
									"",
								]
								"resources": [
									"configmaps",
									"persistentvolumeclaims",
									"pods",
									"secrets",
									"serviceaccounts",
									"services",
									"services/finalizers",
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
									"",
								]
								"resources": [
									"namespaces",
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
									"",
								]
								"resources": [
									"namespaces/status",
								]
								"verbs": [
									"get",
									"patch",
									"update",
								]
							},
							{
								"apiGroups": [
									"extensions",
								]
								"resources": [
									"ingresses",
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
									"image.openshift.io",
								]
								"resources": [
									"imagestreams",
								]
								"verbs": [
									"get",
									"list",
									"watch",
								]
							},
							{
								"apiGroups": [
									"jaegertracing.io",
								]
								"resources": [
									"jaegers",
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
									"jaegertracing.io",
								]
								"resources": [
									"jaegers/finalizers",
								]
								"verbs": [
									"update",
								]
							},
							{
								"apiGroups": [
									"jaegertracing.io",
								]
								"resources": [
									"jaegers/status",
								]
								"verbs": [
									"get",
									"patch",
									"update",
								]
							},
							{
								"apiGroups": [
									"kafka.strimzi.io",
								]
								"resources": [
									"kafkas",
									"kafkausers",
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
									"logging.openshift.io",
								]
								"resources": [
									"elasticsearch",
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
									"logging.openshift.io",
								]
								"resources": [
									"elasticsearches",
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
									"monitoring.coreos.com",
								]
								"resources": [
									"servicemonitors",
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
									"networking.k8s.io",
								]
								"resources": [
									"ingresses",
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
									"rbac.authorization.k8s.io",
								]
								"resources": [
									"clusterrolebindings",
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
									"route.openshift.io",
								]
								"resources": [
									"routes",
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
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "ClusterRole"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "proxy-role"
						}
						"rules": [
							{
								"apiGroups": [
									"authentication.k8s.io",
								]
								"resources": [
									"tokenreviews",
								]
								"verbs": [
									"create",
								]
							},
							{
								"apiGroups": [
									"authorization.k8s.io",
								]
								"resources": [
									"subjectaccessreviews",
								]
								"verbs": [
									"create",
								]
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "RoleBinding"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "leader-election-rolebinding"
							"namespace": parameter.namespace
						}
						"roleRef": {
							"apiGroup": "rbac.authorization.k8s.io"
							"kind":     "Role"
							"name":     "leader-election-role"
						}
						"subjects": [
							{
								"kind":      "ServiceAccount"
								"name":      "jaeger-operator"
								"namespace": parameter.namespace
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "RoleBinding"
						"metadata": {
							"annotations": {
								"include.release.openshift.io/self-managed-high-availability": "true"
								"include.release.openshift.io/single-node-developer":          "true"
							}
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "prometheus"
							"namespace": parameter.namespace
						}
						"roleRef": {
							"apiGroup": "rbac.authorization.k8s.io"
							"kind":     "Role"
							"name":     "prometheus"
						}
						"subjects": [
							{
								"kind":      "ServiceAccount"
								"name":      "prometheus-k8s"
								"namespace": "openshift-monitoring"
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "ClusterRoleBinding"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "jaeger-operator-proxy-rolebinding"
						}
						"roleRef": {
							"apiGroup": "rbac.authorization.k8s.io"
							"kind":     "ClusterRole"
							"name":     "proxy-role"
						}
						"subjects": [
							{
								"kind":      "ServiceAccount"
								"name":      "jaeger-operator"
								"namespace": parameter.namespace
							},
						]
					},
					{
						"apiVersion": "rbac.authorization.k8s.io/v1"
						"kind":       "ClusterRoleBinding"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "manager-rolebinding"
						}
						"roleRef": {
							"apiGroup": "rbac.authorization.k8s.io"
							"kind":     "ClusterRole"
							"name":     "manager-role"
						}
						"subjects": [
							{
								"kind":      "ServiceAccount"
								"name":      "jaeger-operator"
								"namespace": parameter.namespace
							},
						]
					},
					{
						"apiVersion": "v1"
						"kind":       "Service"
						"metadata": {
							"labels": {
								"app.kubernetes.io/component": "metrics"
								"name":                        "jaeger-operator"
							}
							"name":      "jaeger-operator-metrics"
							"namespace": parameter.namespace
						}
						"spec": {
							"ports": [
								{
									"name":       "https"
									"port":       8443
									"protocol":   "TCP"
									"targetPort": "https"
								},
							]
							"selector": {
								"name": "jaeger-operator"
							}
						}
					},
					{
						"apiVersion": "v1"
						"kind":       "Service"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "jaeger-operator-webhook-service"
							"namespace": parameter.namespace
						}
						"spec": {
							"ports": [
								{
									"port":       443
									"protocol":   "TCP"
									"targetPort": 9443
								},
							]
							"selector": {
								"name": "jaeger-operator"
							}
						}
					},
					{
						"apiVersion": "apps/v1"
						"kind":       "Deployment"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "jaeger-operator"
							"namespace": parameter.namespace
						}
						"spec": {
							"replicas": 1
							"selector": {
								"matchLabels": {
									"name": "jaeger-operator"
								}
							}
							"strategy": {}
							"template": {
								"metadata": {
									"labels": {
										"name": "jaeger-operator"
									}
								}
								"spec": {
									"containers": [
										{
											"args": [
												"start",
												"--health-probe-bind-address=:8081",
												"--leader-elect",
											]
											"command": [
												"/jaeger-operator",
											]
											"env": [
												{
													"name": "WATCH_NAMESPACE"
													"valueFrom": {
														"fieldRef": {
															"fieldPath": "metadata.annotations['olm.targetNamespaces']"
														}
													}
												},
												{
													"name": "POD_NAMESPACE"
													"valueFrom": {
														"fieldRef": {
															"fieldPath": "metadata.namespace"
														}
													}
												},
												{
													"name":  "OPERATOR_NAME"
													"value": "jaeger-operator"
												},
											]
											"image": "quay.io/jaegertracing/jaeger-operator:1.44.0"
											"livenessProbe": {
												"httpGet": {
													"path": "/healthz"
													"port": 8081
												}
												"initialDelaySeconds": 15
												"periodSeconds":       20
											}
											"name": "jaeger-operator"
											"ports": [
												{
													"containerPort": 9443
													"name":          "webhook-server"
													"protocol":      "TCP"
												},
											]
											"readinessProbe": {
												"httpGet": {
													"path": "/readyz"
													"port": 8081
												}
												"initialDelaySeconds": 5
												"periodSeconds":       10
											}
											"resources": {
												"limits": {
													"cpu":    "500m"
													"memory": "512Mi"
												}
												"requests": {
													"cpu":    "100m"
													"memory": "128Mi"
												}
											}
											"securityContext": {
												"allowPrivilegeEscalation": false
											}
											"volumeMounts": [
												{
													"mountPath": "/tmp/k8s-webhook-server/serving-certs"
													"name":      "cert"
													"readOnly":  true
												},
											]
										},
										{
											"args": [
												"--secure-listen-address=0.0.0.0:8443",
												"--upstream=http://127.0.0.1:8383/",
												"--logtostderr=true",
												"--v=0",
											]
											"image": "gcr.io/kubebuilder/kube-rbac-proxy:v0.13.0"
											"name":  "kube-rbac-proxy"
											"ports": [
												{
													"containerPort": 8443
													"name":          "https"
													"protocol":      "TCP"
												},
											]
											"resources": {
												"limits": {
													"cpu":    "500m"
													"memory": "128Mi"
												}
												"requests": {
													"cpu":    "5m"
													"memory": "64Mi"
												}
											}
										},
									]
									"securityContext": {
										"runAsNonRoot": true
									}
									"serviceAccountName":            "jaeger-operator"
									"terminationGracePeriodSeconds": 10
									"volumes": [
										{
											"name": "cert"
											"secret": {
												"defaultMode": 420
												"secretName":  "jaeger-operator-service-cert"
											}
										},
									]
								}
							}
						}
					},
					{
						"apiVersion": "cert-manager.io/v1"
						"kind":       "Certificate"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "jaeger-operator-serving-cert"
							"namespace": parameter.namespace
						}
						"spec": {
							"dnsNames": [
								"jaeger-operator-webhook-service.jaeger-operator.svc",
								"jaeger-operator-webhook-service.jaeger-operator.svc.cluster.local",
							]
							"issuerRef": {
								"kind": "Issuer"
								"name": "jaeger-operator-selfsigned-issuer"
							}
							"secretName": "jaeger-operator-service-cert"
							"subject": {
								"organizationalUnits": [
									"jaeger-operator",
								]
							}
						}
					},
					{
						"apiVersion": "cert-manager.io/v1"
						"kind":       "Issuer"
						"metadata": {
							"labels": {
								"name": "jaeger-operator"
							}
							"name":      "jaeger-operator-selfsigned-issuer"
							"namespace": parameter.namespace
						}
						"spec": {
							"selfSigned": {}
						}
					},
					{
						"apiVersion": "admissionregistration.k8s.io/v1"
						"kind":       "MutatingWebhookConfiguration"
						"metadata": {
							"annotations": {
								"cert-manager.io/inject-ca-from": "jaeger-operator/jaeger-operator-serving-cert"
							}
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "jaeger-operator-mutating-webhook-configuration"
						}
						"webhooks": [
							{
								"admissionReviewVersions": [
									"v1",
								]
								"clientConfig": {
									"service": {
										"name":      "jaeger-operator-webhook-service"
										"namespace": parameter.namespace
										"path":      "/mutate-v1-deployment"
									}
								}
								"failurePolicy": "Ignore"
								"name":          "deployment.sidecar-injector.jaegertracing.io"
								"objectSelector": {
									"matchExpressions": [
										{
											"key":      "name"
											"operator": "NotIn"
											"values": [
												"jaeger-operator",
											]
										},
									]
								}
								"rules": [
									{
										"apiGroups": [
											"apps",
										]
										"apiVersions": [
											"v1",
										]
										"operations": [
											"CREATE",
											"UPDATE",
										]
										"resources": [
											"deployments",
										]
									},
								]
								"sideEffects": "None"
							},
							{
								"admissionReviewVersions": [
									"v1",
								]
								"clientConfig": {
									"service": {
										"name":      "jaeger-operator-webhook-service"
										"namespace": parameter.namespace
										"path":      "/mutate-jaegertracing-io-v1-jaeger"
									}
								}
								"failurePolicy": "Fail"
								"name":          "mjaeger.kb.io"
								"rules": [
									{
										"apiGroups": [
											"jaegertracing.io",
										]
										"apiVersions": [
											"v1",
										]
										"operations": [
											"CREATE",
											"UPDATE",
										]
										"resources": [
											"jaegers",
										]
									},
								]
								"sideEffects": "None"
							},
						]
					},
					{
						"apiVersion": "admissionregistration.k8s.io/v1"
						"kind":       "ValidatingWebhookConfiguration"
						"metadata": {
							"annotations": {
								"cert-manager.io/inject-ca-from": "jaeger-operator/jaeger-operator-serving-cert"
							}
							"labels": {
								"name": "jaeger-operator"
							}
							"name": "jaeger-operator-validating-webhook-configuration"
						}
						"webhooks": [
							{
								"admissionReviewVersions": [
									"v1",
								]
								"clientConfig": {
									"service": {
										"name":      "jaeger-operator-webhook-service"
										"namespace": parameter.namespace
										"path":      "/validate-jaegertracing-io-v1-jaeger"
									}
								}
								"failurePolicy": "Fail"
								"name":          "vjaeger.kb.io"
								"rules": [
									{
										"apiGroups": [
											"jaegertracing.io",
										]
										"apiVersions": [
											"v1",
										]
										"operations": [
											"CREATE",
											"UPDATE",
										]
										"resources": [
											"jaegers",
										]
									},
								]
								"sideEffects": "None"
							},
						]
					},
				]
			},
		]
		policies: [
			{
				type: "shared-resource"
				name: "jaeger-operator-ns"
				properties: rules: [{
					selector: resourceTypes: ["Namespace"]
				}]
			},
			{
				type: "topology"
				name: "deploy-jaeger-operator"
				properties: {
					namespace: parameter.namespace
					if parameter.clusters != _|_ {
						clusters: parameter.clusters
					}
					if parameter.clusters == _|_ {
						clusterLabelSelector: {}
					}
				}
			},
		]
	}
}
