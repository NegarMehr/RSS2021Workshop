---
layout: page
title: Safe Motion Planning
description: 
img: /assets/img/safe-planning.jpg
importance: 1
---

Uncertainties are intrinsic to robots; robots may be subject to disturbances, modeling ambiguity, and uncertain localization. One of the key aspects of autonomous systems operating in cage-free environments is their ability to account for uncertainty inherent in the world. For instance, an autonomous car has to successfully deal with uncertainty in possible future motion of other traffic participants in order to avoid collisions and near misses. We are interested in developing control and planning algorithms that enable robots to reason about such uncertainties safely and efficiently. 


## Safe Planning under Modeling Errors

Robotic systems are subject to model mismatch and errors. Model errors may come from the underlying uncertainties in robotic systems or they may arise from learned components such as deep learned models. For instance, when an autonomous is required to avoid a collision with an obstacle, the position of the obstacle may be obtained from a learning-based perception module which is subject to uncertainties and modeling error. Therefore, to operate safely, robots need to reason about such model errors safely and efficiently. We are interested in developing motion planning algorithms that enable safe and efficient motion of robotic systems that are subject to model errors that arise from uncertainties or learned components. 


## Safe Robotic Interactions

Modeling the stochastic behavior of interacting agents is key for safe motion planning. To act safely in a dynamic and uncertain environment, robots must (i) consider the risk associated with their actions, and (ii) account for feedback interactions with other risk-sensitive agents. Existing work typically ignores one or both of these two elements. We are interested in developing planning algorithms that allow robots to reason about the uncertainties underlying their interactions. When dealing with uncertainties, assuming that all agents capture a notion of risk in their planning, we argue that to generate a more realistic and time efficient behavior for autonomous agents, it becomes crucial to model the interaction of risk-sensitive agents. 
